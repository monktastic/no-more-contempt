# The spiral, and why it isn't dependency hell

*You keep hitting circular dependencies and calling it a problem. It isn't one. The spiral was always the solution to it — you just haven't had a way to check whether a given spiral is working. Here's the formal version, which takes about a page, and then the specific cycle you're stuck in.*

---

## 1. A spiral is a DAG. You just need a second index.

A node in the book isn't a claim. It's a **(claim, depth)** pair.

Three kinds of edge:

- **Within a depth.** (X, d) → (Y, d): at this depth, Y needs X.
- **Between depths.** (X, d) → (X, d+1): you can only deepen something the reader already holds.
- **Across, upward.** (X, d) → (Y, d+1): the deeper version of Y needs the shallower version of X.

Now watch what happens to a cycle. X and Y depend on each other, which is impossible. But:

> (X, 1) → (Y, 1) → (X, 2) → (Y, 2) → (X, 3)…

is perfectly acyclic. The cycle only existed because you were treating "X" as one node. It's not one node. It's a column of them.

**That is exactly what a spiral is**, and it's why the structure isn't a stylistic preference. It's the only shape that can carry mutually-dependent claims.

## 2. Every cycle needs a door, and the door is evocation

The column still has to start somewhere. (X, 1) can't depend on (Y, 0) if (Y, 0) depends on (X, 1).

So the first node in any cycle must have **no dependency on anything the book has said.** There are exactly two kinds of node like that:

**Evocation.** You ask the reader to recall or run something from their own life. The recall of cheating. The two strangers. The gaze experiment. The moment they actually saw someone. These have in-degree zero *from the book* — their inputs come from the reader's biography, which is already there before page one.

**Transmission.** The reader is affected by the writing itself rather than convinced by it. Feeling the taunt land. The "fuck yes" recognition. This also takes no premises.

Everything else — every inference, every generalization, every claim about scale — has to hang off one of those two.

**So the rule is:** you cannot open a cycle with an argument. Ever. You open it with something the reader already owns, and then you climb.

This is the formal version of what you've been saying for two years. It also explains why the parts of the book that fight you are always the parts where you tried to enter a loop through the wrong door.

## 3. What "state it poorly at first" actually means

Earlier I said to state a claim once and admit the debt. That was imprecise, and it's worth fixing, because "state it poorly" sounds like writing something false on purpose.

**The shallow version isn't a degraded statement of the deep claim. It's a complete statement of a smaller claim.**

(X, 1) must be *true as far as it goes*. It just goes less far. Depth 1 of "contempt is evil" isn't a vague gesture at the full identification — it's the precise and complete claim that one stranger made turning away easier and the other made it harder, which the reader verified. Nothing hedged. Nothing owed. It's simply a smaller true thing, and it's what (X, 2) will be built on.

If your depth-1 version needs a hedge, it isn't a depth-1 version. It's the depth-3 version, said early.

That's the test, and it's mechanical: *can I state this at this depth with no qualifier and no promissory note, and have it be flatly true?* If no, cut it back until yes.

## 4. The test for whether a pass is working

A spiral pass must add something **checkable** that wasn't available before. Not more conviction. Not stronger language. Not a bigger claim.

If pass two says the same thing as pass one with more force, that isn't a spiral. It's repetition, and the reader will feel harangued rather than deepened. This is the failure mode that produces the shame-collapse risk in Chapter 3: escalation without new footing.

Concretely, each pass should be able to answer: *what can the reader check now that they couldn't check last time?*

---

## 5. Your actual cycle, resolved

Here's the one you're in dependency hell about.

- To see the parasite in someone else rather than seeing them as evil, you need to be relatively free of your own. *(SEE-OTHER needs FREE-SELF.)*
- To be free of your own, you need to see your own. *(FREE-SELF needs SEE-SELF.)*
- To see your own, you need to know what the thing looks like — which you learned by seeing it in somebody else. *(SEE-SELF needs SEE-OTHER.)*

That's a hard three-cycle, and no amount of argument gets you into it.

Two doors, both already in your book:

**Door 1 — memory.** The reader has already done both, at low intensity, and can be sent back to check. They have caught themselves in limbo (Chapter 1's opening). And they have seen somebody clearly at least once — the passage I added to Interlude One. Neither is derived. Both are given.

**Door 2 — transmission.** Somebody freer than you does it *to* you, and the seeing happens without being argued for. That's the second stranger. It's also pointing-out instruction. This is why the second stranger can't be replaced by a better argument, and why the book keeps insisting the exit isn't conceptual: **the cycle is mathematically closed to argument and open to contact.**

So the resolved order is:

> **memory** → SEE-SELF(1) → SEE-OTHER(1) → FREE-SELF(1) → SEE-SELF(2) → SEE-OTHER(2) → …

Each turn buys a little more of the next, and no step ever needs more than the reader has.

And notice what falls out for free: this predicts that nobody gets out alone and nobody gets out all at once. Which is what every contemplative tradition reports, and what you've said about your own practice.

---

## 6. Do you need a DAG for the whole book?

Not yet, and possibly not ever in full.

What's worth mapping is **the cycles**, because those are the only places the ordering is genuinely constrained. Linear stretches order themselves. There are, as far as I can see, four cycles in this book:

1. **See-self / see-other / free-self.** Resolved above. This is the big one.
2. **Contempt is evil / evil is what conscience detects / conscience detects contempt.** Entered through the cheating recall — the reader finds the content of the knowing before either term is defined.
3. **The parasite hides by being taken for you / you fight it as you / that feeds it.** Entered through the stranger: the reader sees this from outside, in someone else, before it's turned on them.
4. **You can't see it while you're in it / you must see it to get out.** Entered through memory of a past self you can now see clearly — the reader has already exited one of these, at least once, and can be reminded that they did.

Map those four, and the rest of the book is a topological sort with a lot of freedom in it. `dags/roadmap-dag.dot` already does the linear part.
