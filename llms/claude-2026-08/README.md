# No More Contempt

Working repo for the book. Open it with Claude Code; `CLAUDE.md` carries the
rules and the map of what's here, and is read at the start of every session.

The long book is in `long-book/`; the short book, for practitioners, is in
`short-book/`; the plan for a general reader's book is in `general-book/`. `discoveries.md` indexes what's been worked out;
`engine.md` is the plan; `themes.md` and `chapter-1-ledger.md` are the
regression checks. `todo.md` is the one file that holds open work. The key
points the chapters are written from are in `../../scratch/key-points/`
(`index.md` for everything, `spine.md` for the theses in book order).

`./build-manuscript.sh` builds `working-manuscript.md` for auditing;
`./build-short-manuscript.sh` does the same for the short book, and also writes
`short-manuscript-clean.md`, the copy to send to readers.
`./publish.sh` generates the website into the repo root and
`./make-downloads.sh` the EPUB, PDF, and single file; both outputs are
gitignored, and the GitHub Actions build regenerates them on every push to
main, so pushing a change to the manuscript is all it takes to publish.

Graphs: `dot -Tsvg dags/book-map.dot -o dags/book-map.svg` (same for
`roadmap-dag`, `spiral-cycle` and `core-circle`).
