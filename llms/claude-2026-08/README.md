# No More Contempt

Working repo for the book. Open it with Claude Code; `CLAUDE.md` carries the
rules and gets read automatically at the start of every session.

## Layout

Settled chapters go in `manuscript/`, which an assistant will not edit unless
you name the file and ask. Everything else sits in the base directory and is
open for editing.

```
manuscript/                        settled chapters (protected)
interlude-one.md                   draft; goes after Chapter 1
roadmap-for-beta-readers.md        map of the unwritten rest; will not ship
appendix-what-others-have-seen.md  draft appendix on the neighbouring literature
argument.md                        master statement of what the book claims
discoveries.md                     index of everything worked out, and where it lives
correspondence.md                  why what conscience knows turns out to be right
audit.md                           novelty vs prior art; what Chapter 1 can support
todo.md                            open problems, biggest first
claim-triage.md                    how much to establish a claim, and when
spiral.md                          why the circular dependencies aren't a problem
dags/                              dependency graphs (.dot is the source)
archive/                           kept for the reasoning, not for reuse
```

## Where to start

`discoveries.md`. It indexes everything that's been worked out and points at
the file each thing lives in. `todo.md` has the open problems, with the case
that could falsify the thesis at the top.

Your job: read discoveries.md, argument.md, and todo.md, then tell me what you think the highest-value next move is.

## Regenerating the graphs

```
dot -Tsvg dags/roadmap-dag.dot -o dags/roadmap-dag.svg
dot -Tsvg dags/spiral-cycle.dot -o dags/spiral-cycle.svg
```
