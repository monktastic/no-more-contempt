# Working rules for this repository

This is the working repo for *No More Contempt*, a nonfiction book.

## Editing

**Edit files in place, including everything in `manuscript/`.** Never make a
second copy of a file to draft against, and never leave two live versions of
anything. Git is the safety net; I read diffs and revert what I don't want.

What that does not license: rewriting settled prose because you think it could
be better. Do what I asked and say plainly what you touched, so the diff holds
no surprises. If a fix I asked for turns out to need a change I didn't ask for,
make the change and tell me, rather than stopping to check.

## What's here

Everything the book is made of lives in `manuscript/`. The base directory holds
the working documents: what the book claims, what's open, and how to decide.

`manuscript/preface.md`, `chapter-1.md`, `chapter-1a.md` (the interlude after
Chapter 1), `chapter-2.md`, `chapter-3.md`, `chapter-4.md`.
`manuscript/rest-of-book.md` the map of the unwritten rest, for beta readers.
Scaffolding; will not be in the finished book, but it does go into the build.
`manuscript/appendix-1-recursion.md` the recursion, stated without formalism.
`manuscript/appendix-2-what-others-have-seen.md` the neighbouring literature.

`argument.md` the master statement of what the book claims. If a draft and this
disagree, one is wrong; say so.
`discoveries.md` index of everything worked out so far and where each thing
lives. **Read this first.**
`correspondence.md` the philosophical problem of why conscience's knowing
tracks the good.
`audit.md` what's novel vs. prior art; what Chapter 1 can support.
`todo.md` open problems, biggest first.
`fable-queue.md` work that needs judgment, waiting for a Fable session.
`claim-triage.md` how much to establish a claim, and when.
`spiral.md` why circular dependencies aren't a problem here.
`dags/` dependency graphs. The `.dot` is the source; regenerate with
`dot -Tsvg f.dot -o f.svg`.
`archive/` kept for the reasoning, not for reuse. References in here point at
files under their old names; that's the historical record and stays as it is.
`build-manuscript.sh` builds `working-manuscript.md` from the manuscript files.
Generated output; never edit it.

## How I want you to work

Tell me when I'm wrong. Disagree in the message rather than complying and
hedging. If I ask for something that will make the book worse, say so and
say why before doing it.

No LLM tics: no spaced em-dashes, no "it's worth noting", no invented jargon
used as though it were standard, no sentences over about forty words, no
answering objections the reader hasn't formed yet.

## Voice

Anything that could end up in the book is written in my voice, not an
assistant's. Clear, powerful English. If you can't hear me saying it, it's
wrong.

Banned outright, because I keep finding them:

- **Machine abstraction.** "Nothing went through while the person was in view."
  Say who did what to whom. Name the person, the act, the moment.
- **The symmetry tic.** "Not a symptom. The thing." "It doesn't feel like three
  things. It feels like one." Once in a while this lands. Three times in a
  chapter and it reads as a verbal habit rather than a thought.
- **Announcing the paragraph before writing it.** "Let me now say what that
  costs." Sometimes I do this on purpose, for pacing. You should not do it by
  reflex.
- **Bookkeeping in the prose.** "It's on the list of debts at the end of this
  interlude." The reader is reading a book, not a ledger. Say the thing.
- **"It's worth noting", "it's worth being exact", "here's the thing",
  "crucially", "fundamentally", "ultimately", "to be clear", "that said".**
- **Invented verbs, nouns pressed into service as verbs, and abbreviations I
  don't use.** No "unpack", "surface" as a verb, "lean into", "double down".
- **Cutesiness.** No winking at the reader, no jokes that ask to be noticed.

Fragments are allowed and are sometimes the point. More than one or two on a
page and they stop working. Read it aloud before you keep it. If it sounds like
a memo, cut it.

## Which model is running, and what each may do

The system prompt's model name goes stale when I switch models mid-session. The
reliable tell is the git attribution line in the harness instructions: it names
the current model and updates on every switch. Check it before deciding what
you're allowed to do. If you genuinely can't tell, assume Opus.

**Opus may do:** tic sweeps, cross-reference checks, vocabulary checks, debt
checks, scope sweeps reported but not applied, dag regeneration, file moves,
pointer and link repair, applying a decision I have already made, building the
working manuscript, grading feedback against the drafts.

**Fable only:** anything structural; anything that changes what the book claims
or what it says it has earned; deciding what a chapter is allowed to assert;
new prose that goes in the book; judging whether something has been shown;
resolving a conflict between `argument.md` and a draft.

If you're Opus and the task is Fable's, do not do it. Append it to
`fable-queue.md` with enough context to act on later, tell me you've queued it,
and finish whatever mechanical part you legitimately can.

If you're Fable, read `fable-queue.md` at the start of the session and tell me
what's in it before starting new work.

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

**full audit** — only when I ask for it by this name. Never on your own
initiative and never as a warm-up to something else. The procedure:

1. `./build-manuscript.sh`, then read `working-manuscript.md` start to finish
   before checking anything. First impressions in a paragraph.
2. Every claim in the manuscript against `argument.md`. Disagreements are a
   fault in one of them; say which and why.
3. Every claim against `claim-triage.md`: is it stated, demonstrated, argued or
   earned, and is that the right grade for where it sits?
4. Debts. Every promise made, and whether anything pays it.
5. Cross-references, vocabulary, tics, scope. The named passes above.
6. Report as a single ordered list, highest value first, with file and line.
   Fix nothing until I say so.
