# Working rules for this repository

This is the working repo for *No More Contempt*, a nonfiction book.

## The one hard rule

**Do not edit anything in `manuscript/` unless I name the file and ask.**
That directory holds settled drafts. You may read them freely, quote them,
check other files against them, and tell me what you think is wrong with
them. You may not change them on your own initiative.

Everything in the base directory is fair game to edit.

## What's here

`manuscript/` settled chapters. Read-only unless asked.
`interlude-one.md` draft. Goes after Chapter 1.
`roadmap-for-beta-readers.md` a map of the unwritten rest of the book. Scaffolding; will not be in the finished book.
`appendix-what-others-have-seen.md` draft appendix on the neighbouring literature.
`argument.md` the master statement of what the book claims. If a draft and this disagree, one is wrong; say so.
`discoveries.md` index of everything worked out so far and where each thing lives. **Read this first.**
`correspondence.md` the philosophical problem of why conscience's knowing tracks the good.
`audit.md` what's novel vs. prior art; what Chapter 1 can support.
`todo.md` open problems, biggest first.
`claim-triage.md` how much to establish a claim, and when.
`spiral.md` why circular dependencies aren't a problem here.
`dags/` dependency graphs. The `.dot` is the source; regenerate with `dot -Tsvg f.dot -o f.svg`.
`archive/` kept for the reasoning, not for reuse.

## How I want you to work

Tell me when I'm wrong. Disagree in the message rather than complying and
hedging. If I ask for something that will make the book worse, say so and
say why before doing it.

No LLM tics: no spaced em-dashes, no "it's worth noting", no invented jargon
used as though it were standard, no sentences over about forty words, no
answering objections the reader hasn't formed yet.

When you change a claim in a draft, check `argument.md` and update it too,
marking the revision.

After any structural edit, update the relevant `.dot` and re-render it.

## Passes to run on request

Ask for these by name.

**scope sweep** — find every "everyone", "always", "never", "cannot",
"nobody", "all". For each: is it about what the reader verified in their own
case, or about everyone? The second kind moves to a marked tier or gets
graded. This is the highest-value pass currently owed.

**cross-reference check** — every "section N", "Part X", "Chapter N" resolves
to something that exists and says what it's cited for.

**vocabulary check** — one name per thing. "Parasite", not "dark part".
"Contempt" for the hot interpersonal form only; "turning away" for what hot
and cold share.

**debt check** — every promise made in a draft ("this gets its own chapter")
has a chapter that pays it, or the promise comes out.

**tic sweep** — the list above, mechanically.

**dag sync** — regenerate graphs after structural edits.
