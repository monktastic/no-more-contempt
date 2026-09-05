# No More Contempt

Working repo for the book. Open it with Claude Code; `CLAUDE.md` carries the
rules and gets read automatically at the start of every session.

## Layout

The book lives in `manuscript/`. The working documents sit in the base
directory. Everything is edited in place; git is the safety net.

```
manuscript/                        the book
  preface.md
  chapter-1.md, chapter-1a.md      Chapter 1 and the interlude after it
  chapter-2.md, chapter-3.md, chapter-4.md
  chapter-5.md                     the whole book once, condensed and tiered
  rest-of-book.md                  map of the unwritten rest, for beta readers
  appendix-1-recursion.md
  appendix-2-what-others-have-seen.md
argument.md                        master statement of what the book claims
discoveries.md                     index of what's been worked out, and where
correspondence.md                  why what conscience knows turns out to be right
audit.md                           novelty vs prior art; what Chapter 1 supports
todo.md                            the one state file: open work, by owner
claim-triage.md                    how much to establish a claim, and when
spiral.md                          why the circular dependencies aren't a problem
dags/                              dependency graphs (.dot is the source)
archive/                           kept for the reasoning, not for reuse
build-manuscript.sh                builds working-manuscript.md (generated)
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
