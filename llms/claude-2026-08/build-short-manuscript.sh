#!/bin/sh
# Concatenates the short book (short-version-manuscript/) plus the appendices
# into short-manuscript.md for auditing. Generated file; edit the sources.
cd "$(dirname "$0")" || exit 1
out=short-manuscript.md
{
  printf '<!-- Built %s by build-short-manuscript.sh. Generated file; edit the sources. -->\n' "$(date +%F)"
  for f in short-version-manuscript/preface.md short-version-manuscript/intro.md $(ls short-version-manuscript/chapter-*.md | sort -V) \
           manuscript/appendix-1-recursion.md \
           manuscript/appendix-2-what-others-have-seen.md \
           manuscript/appendix-3-the-traditions.md; do
    [ -f "$f" ] || { printf 'missing: %s\n' "$f" >&2; exit 1; }
    printf '\n\n<!-- ===== %s ===== -->\n\n' "$f"
    cat "$f"
  done
} > "$out"
printf '%s: %s words\n' "$out" "$(wc -w < "$out" | tr -d ' ')"
