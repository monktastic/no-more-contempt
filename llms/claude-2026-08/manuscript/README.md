# The book

These are the chapters, in reading order, plus the two appendices. Everything
here is edited in place; git is the safety net.

  start-here.md    orientation for early readers; the site's front page
  preface.md
  chapter-1.md
  chapter-1a.md    the interlude that follows Chapter 1
  chapter-2.md
  chapter-3.md
  chapter-4.md
  chapter-5.md     the whole book once, in 2,500 words, tiered
  rest-of-book.md  map of the unwritten rest, for beta readers
  appendix-1-recursion.md
  appendix-2-what-others-have-seen.md
  appendix-3-the-traditions.md

`../build-manuscript.sh` concatenates these into `../working-manuscript.md`.
`../publish.sh` generates the website pages from them into the repo root
(`index.md`, `book/`, `map/`, `appendix/`). Add a file here and it must be
added to both scripts.
