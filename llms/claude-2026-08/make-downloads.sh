#!/bin/sh
# Builds the whole draft as one file in three formats, for readers who would
# rather not read a website: no-more-contempt.md, .epub and .pdf, plus a
# Downloads page that links them. Output goes to <repo root>/downloads by
# default, or to DIR with --out DIR (which is how CI will call it).
#
# Sources are manuscript/, in the order the site's menu follows, with TODOs and
# working notes stripped exactly as publish.sh strips them (same code, in
# bookparts.py). Needs pandoc; the PDF also needs a LaTeX engine, typst, or
# Calibre's ebook-convert, and is skipped with a warning if none is installed.
cd "$(dirname "$0")" || exit 1

OUT=../../downloads
while [ $# -gt 0 ]; do
  case "$1" in
    --out) OUT="$2"; shift 2 ;;
    --out=*) OUT="${1#--out=}"; shift ;;
    -h|--help) sed -n '2,10p' "$0" | cut -c3-; exit 0 ;;
    *) printf 'make-downloads.sh: unknown option %s\n' "$1" >&2; exit 1 ;;
  esac
done

command -v pandoc >/dev/null 2>&1 || {
  echo 'make-downloads.sh: pandoc not found (brew install pandoc)' >&2; exit 1; }

mkdir -p "$OUT" || exit 1
OUT=$(cd "$OUT" && pwd)
SHA=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)
DATE=$(date '+%-d %B %Y')
TMP=$(mktemp -d "${TMPDIR:-/tmp}/no-more-contempt.XXXXXX") || exit 1
trap 'rm -rf "$TMP"' EXIT
BODY=$TMP/body.md
META=$TMP/metadata.yaml
cat > "$META" <<YAML
title: No More Contempt
subtitle: Working draft, built from commit $SHA
author: Aditya Prasad
date: $DATE
lang: en-GB
YAML

FROM=markdown-yaml_metadata_block-multiline_tables-simple_tables

OUT="$OUT" BODY="$BODY" SHA="$SHA" DATE="$DATE" TMP="$TMP" python3 - <<'PY' || exit 1
import os, pathlib, re
from bookparts import (READING_ORDER, TITLE_OVERRIDES, TITLE, AUTHOR, SITE_URL,
                       BOOK_FILES, MAP, split_title, strip_todos,
                       banner_to_markdown, pages, start_here_counts)

MAN = pathlib.Path('manuscript')
OUT = pathlib.Path(os.environ['OUT'])
stamp = (f'*Working draft of {os.environ["DATE"]}, built from commit '
         f'{os.environ["SHA"]}. The current version is always at {SITE_URL}.*')

def source_words(names):
    return sum(len((MAN / n).read_text().split()) for n in names)

sections = []
for name in READING_ORDER:
    title, body = split_title((MAN / name).read_text())
    title = TITLE_OVERRIDES.get(name) or title
    body = banner_to_markdown(strip_todos(body))
    if name == 'start-here.md':
        body = start_here_counts(body, source_words(BOOK_FILES), source_words(MAP))
        # A website instruction, meaningless in a file with no menu.
        body = body.replace('\nThe menu on the left follows this order.\n', '')
    sections.append((title, body.strip() + '\n'))

def slug(title):
    return re.sub(r'[^a-z0-9-]', '', re.sub(r'\s+', '-', title.lower()))

contents = '\n'.join(f'- [{t}](#{slug(t)})' for t, _ in sections)
body = '\n\n'.join(f'# {t}\n\n{b}' for t, b in sections)
words = len(body.split())

(OUT / 'no-more-contempt.md').write_text(
    f'# {TITLE}\n\n{AUTHOR}\n\n{stamp}\n\n## Contents\n\n{contents}\n\n\n{body}')
# The other formats get their title page from pandoc's metadata, so they read
# the same text without the heading that would show up as a first chapter.
pathlib.Path(os.environ['BODY']).write_text(body)
print(f'{words:,} words')
pathlib.Path(os.environ['TMP'] + '/words').write_text(str(words))
PY

# EPUB. Level-1 headings are the chapters, so the reader's table of contents
# gets one entry per chapter and each opens on its own page.
if pandoc --help | grep -q -- --split-level; then  # renamed in pandoc 3
  split=--split-level=1
else
  split=--epub-chapter-level=1
fi
pandoc "$BODY" --from="$FROM" --to=epub3 --metadata-file="$META" \
  --toc --toc-depth=2 "$split" \
  --output="$OUT/no-more-contempt.epub" || exit 1

# PDF. Whatever engine the machine has: pandoc's own if there's a LaTeX or typst
# installation, otherwise Calibre, converting the EPUB we just made.
PDF="$OUT/no-more-contempt.pdf"
PDFMETA=$TMP/pdf.yaml
engine=
# typst first: it's what the Actions build installs, so a PDF made here looks
# like the one on the site. Calibre is the fallback for a machine with none.
for e in typst xelatex lualatex tectonic pdflatex; do
  command -v "$e" >/dev/null 2>&1 && { engine=$e; break; }
done
if [ "$engine" = typst ]; then
  # Typst spells the page settings its own way, and numbers pages only if asked.
  cat > "$PDFMETA" <<'YAML'
margin:
  x: 1.25in
  y: 1.1in
papersize: us-letter
page-numbering: "1"
fontsize: 12pt
linestretch: 1.15
mainfont: Libertinus Serif
header-includes:
  - |
    ```{=typst}
    #show heading.where(level: 1): it => { pagebreak(weak: true); it }
    ```
YAML
  # mainfont is not optional: pandoc's template leaves the font list empty and
  # typst refuses to start on that. Libertinus Serif is built into the typst
  # binary, so the runner has it without installing a font.
  # No linkcolor either: the template feeds it to rgb(), which wants a hex
  # string and dies on a colour name. Unset leaves links in the text colour.
else
  cat > "$PDFMETA" <<'YAML'
geometry: margin=1.25in
papersize: letter
fontsize: 12pt
linkcolor: black
YAML
fi
if [ -n "$engine" ]; then
  pandoc "$BODY" --from="$FROM" --metadata-file="$META" \
    --metadata-file="$PDFMETA" --pdf-engine="$engine" --toc --toc-depth=1 \
    --output="$PDF" || engine=
elif command -v ebook-convert >/dev/null 2>&1; then
  ebook-convert "$OUT/no-more-contempt.epub" "$PDF" \
    --paper-size letter --pdf-page-margin-top 54 --pdf-page-margin-bottom 54 \
    --pdf-page-margin-left 54 --pdf-page-margin-right 54 \
    --pdf-page-numbers --pdf-hyphenate \
    --extra-css 'a { color: black; text-decoration: none }' >/dev/null && engine=ebook-convert || engine=
fi
if [ -z "$engine" ]; then
  # No engine, or the engine failed: say so, and leave the PDF off the page
  # rather than offering a link to a file that isn't there.
  rm -f "$PDF"
  echo 'make-downloads.sh: no PDF built. Install a PDF engine:' >&2
  echo '  brew install typst   (what the Actions build uses; or calibre, or basictex)' >&2
  # Say it where the run summary shows it, so a missing PDF isn't only visible
  # to whoever opens the log.
  [ -z "$GITHUB_ACTIONS" ] || echo '::warning::no PDF in the downloads: the engine failed or is missing'
fi

# The Downloads page is written last, so it offers only what got built.
OUT="$OUT" SHA="$SHA" DATE="$DATE" TMP="$TMP" \
PDF_OK=$([ -f "$PDF" ] && echo 1 || echo '') python3 - <<'PY' || exit 1
import os, pathlib
from bookparts import pages

OUT = pathlib.Path(os.environ['OUT'])
words = int(pathlib.Path(os.environ['TMP'] + '/words').read_text())
pdf_line = '- [PDF](no-more-contempt.pdf), for printing\n' if os.environ['PDF_OK'] else ''
(OUT / 'index.md').write_text(f'''---
title: "Downloads"
nav_order: 5
permalink: /downloads/
---

<!-- Generated by llms/claude-2026-08/make-downloads.sh. Do not edit; edit the source. -->

# Downloads

The whole draft in one file: Start here, the Preface through Chapter 17, the
appendices, and the map. About {words:,} words, roughly
{pages(words)} pages. Built from commit {os.environ["SHA"]} on {os.environ["DATE"]};
the site is always the current version.

- [EPUB](no-more-contempt.epub), for a reader or a phone
{pdf_line}- [Markdown](no-more-contempt.md), the plain text

The chapters from 6 on are first drafts written by Claude from my notes, and
each one says so where it begins.
''')
PY

printf 'downloads in %s:\n' "$OUT"
for f in no-more-contempt.md no-more-contempt.epub no-more-contempt.pdf index.md; do
  [ -f "$OUT/$f" ] && printf '  %-24s %s\n' "$f" "$(du -h "$OUT/$f" | cut -f1 | tr -d ' ')"
done
[ -n "$engine" ] && printf 'PDF engine: %s\n' "$engine"
exit 0
