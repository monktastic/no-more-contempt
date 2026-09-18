#!/bin/sh
# Concatenates the current book into working-manuscript.md for auditing.
# Every source lives in long-book/. Do not edit the output; edit the sources.
cd "$(dirname "$0")" || exit 1
out=working-manuscript.md
{
  printf '<!-- Built %s by build-manuscript.sh. Generated file; edit the sources. -->\n' "$(date +%F)"
  for f in long-book/start-here.md long-book/preface.md long-book/chapter-1.md long-book/chapter-1a.md \
           long-book/chapter-2.md long-book/chapter-3.md long-book/chapter-4.md \
           long-book/chapter-5.md long-book/rest-of-book.md long-book/appendix-1-recursion.md \
           long-book/appendix-2-what-others-have-seen.md \
           long-book/appendix-3-the-traditions.md \
           long-book/chapter-6.md long-book/chapter-7.md long-book/chapter-8.md long-book/chapter-9.md \
           long-book/chapter-10.md long-book/chapter-11.md long-book/chapter-12.md long-book/chapter-13.md \
           long-book/chapter-14.md long-book/chapter-15.md long-book/chapter-16.md long-book/chapter-17.md; do
    [ -f "$f" ] || { printf 'missing: %s\n' "$f" >&2; exit 1; }
    printf '\n\n<!-- ===== %s ===== -->\n\n' "$f"
    cat "$f"
  done
} > "$out"
printf '%s: %s words\n' "$out" "$(wc -w < "$out" | tr -d ' ')"
