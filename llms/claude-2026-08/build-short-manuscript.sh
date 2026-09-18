#!/bin/sh
# Concatenates the short book (short-book/) plus the appendices.
# Writes two generated files; edit the sources, never these:
#   short-manuscript.md        for auditing: inline [TODO] notes kept, like the
#                              working manuscript.
#   short-manuscript-clean.md  for sending to readers: TODO notes and build
#                              comments stripped.
cd "$(dirname "$0")" || exit 1
out=short-manuscript.md
clean=short-manuscript-clean.md
{
  printf '<!-- Built %s by build-short-manuscript.sh. Generated file; edit the sources. -->\n' "$(date +%F)"
  for f in short-book/preface.md short-book/intro.md $(ls short-book/chapter-*.md | sort -V) \
           long-book/appendix-1-recursion.md \
           long-book/appendix-2-what-others-have-seen.md \
           long-book/appendix-3-the-traditions.md; do
    [ -f "$f" ] || { printf 'missing: %s\n' "$f" >&2; exit 1; }
    printf '\n\n<!-- ===== %s ===== -->\n\n' "$f"
    cat "$f"
  done
} > "$out"
python3 -c "
import re, pathlib
from bookparts import TODO_RE
t = pathlib.Path('$out').read_text()
t = re.sub(r'<!--.*?-->', '', t, flags=re.S)
t = TODO_RE.sub('', t)
t = re.sub(r'\n{3,}', '\n\n', t).strip() + '\n'
pathlib.Path('$clean').write_text(t)
" || exit 1
printf '%s: %s words\n' "$out" "$(wc -w < "$out" | tr -d ' ')"
printf '%s: %s words (no TODO notes; send this one)\n' "$clean" "$(wc -w < "$clean" | tr -d ' ')"
