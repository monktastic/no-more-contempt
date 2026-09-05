#!/bin/sh
# Concatenates the current book into working-manuscript.md for auditing.
# Every source lives in manuscript/. Do not edit the output; edit the sources.
cd "$(dirname "$0")" || exit 1
out=working-manuscript.md
{
  printf '<!-- Built %s by build-manuscript.sh. Generated file; edit the sources. -->\n' "$(date +%F)"
  for f in manuscript/preface.md manuscript/chapter-1.md manuscript/chapter-1a.md \
           manuscript/chapter-2.md manuscript/chapter-3.md manuscript/chapter-4.md \
           manuscript/chapter-5.md manuscript/rest-of-book.md manuscript/appendix-1-recursion.md \
           manuscript/appendix-2-what-others-have-seen.md; do
    [ -f "$f" ] || { printf 'missing: %s\n' "$f" >&2; exit 1; }
    printf '\n\n<!-- ===== %s ===== -->\n\n' "$f"
    cat "$f"
  done
} > "$out"
printf '%s: %s words\n' "$out" "$(wc -w < "$out" | tr -d ' ')"
