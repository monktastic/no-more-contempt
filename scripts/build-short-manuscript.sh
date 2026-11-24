#!/bin/sh
# Concatenates the current book (llms/claude-2026-11/short-book/) plus the
# appendices, in the order bookparts.py gives the site and the downloads.
# Writes two generated files into llms/claude-2026-11/; edit the sources, never these:
#   short-manuscript.md        for auditing: inline [TODO] notes and file markers
#                              kept; holding pens stripped.
#   short-manuscript-clean.md  for sending to readers: TODO notes and build
#                              comments stripped.
SCRIPTS=$(cd "$(dirname "$0")" && pwd) || exit 1
cd "$SCRIPTS/../llms/claude-2026-11" || exit 1
export PYTHONPATH="$SCRIPTS"
out=short-manuscript.md
clean=short-manuscript-clean.md
{
  printf '<!-- Built %s by build-short-manuscript.sh. Generated file; edit the sources. -->\n' "$(date +%F)"
  files=$(python3 -c "
import os
from bookparts import condensed_files, APPENDIX_DIR, APPENDIX_FILES
for f in condensed_files() + [APPENDIX_DIR / a for a in APPENDIX_FILES]:
    print(os.path.relpath(f))
") || exit 1
  for f in $files; do
    [ -f "$f" ] || { printf 'missing: %s\n' "$f" >&2; exit 1; }
    printf '\n\n<!-- ===== %s ===== -->\n\n' "$f"
    cat "$f"
  done
} > "$out"
python3 -c "
import re, pathlib
from bookparts import TODO_RE
t = pathlib.Path('$out').read_text()
# The audit copy keeps the TODO notes and the file markers, but not the holding
# pens or any other comment: they're kept in the sources for recovery, not review.
keep = lambda m: m.group(0) if re.match(r'<!-- (=====|Built )', m.group(0)) else ''
t = re.sub(r'<!--.*?-->', keep, t, flags=re.S)
t = re.sub(r'\n{3,}', '\n\n', t)
pathlib.Path('$out').write_text(t)
t = re.sub(r'<!--.*?-->', '', t, flags=re.S)
t = TODO_RE.sub('', t)
t = re.sub(r'\n{3,}', '\n\n', t).strip() + '\n'
pathlib.Path('$clean').write_text(t)
" || exit 1
printf '%s: %s words\n' "$out" "$(wc -w < "$out" | tr -d ' ')"
printf '%s: %s words (no TODO notes; send this one)\n' "$clean" "$(wc -w < "$clean" | tr -d ' ')"
