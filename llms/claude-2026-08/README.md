# No More Contempt

Working repo for the book. Open it with Claude Code; `CLAUDE.md` carries the
rules and the map of what's here, and is read at the start of every session.

The book is in `manuscript/`. `discoveries.md` indexes what's been worked out.
`todo.md` is the one file that holds open work. `./build-manuscript.sh` builds
`working-manuscript.md` for auditing. `./publish.sh` generates the website
pages into the repo root; commit those with the manuscript.

Graphs: `dot -Tsvg dags/roadmap-dag.dot -o dags/roadmap-dag.svg`.
