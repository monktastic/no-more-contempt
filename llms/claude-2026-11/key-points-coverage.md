# Key-points coverage of the book

A snapshot of `short-book/`, the preface through Chapter 6 and the Epilogue (`chapter-6a.md`), as they stood on November 24, 2026, after Aditya's rewrite of the later chapters. Points are keyed by their index line, which is today's and will drift; the anchors are chapter:line, also today's.

Read as a reader sees it: TODO notes and holding pens don't count. **Weight** follows the weight check: In is a scene, a phrase, an act or a check the reader runs; Thin is a label, a clause, an abstract statement or a generic case. A point whose home is the Picture (Chapter 6) or the vision (the Epilogue) counts as In there if it's concrete there; any other point found only there is Thin. **Prominence** (T0 only) asks whether a first-time reader would come away with it: Stands out (where attention lands, with its question live), Buried (mid-paragraph, after a qualifier, in a list, or before its question), Diluted (competing with a near-restatement, or sharing a paragraph with two or more big claims).

## Summary

1. **T0 (63 points):** every one is in the book. 59 In, 4 Thin (the cartoon 314, the darkest idea 466, the naive pretense 663, and the world as stuff 552 unless Chapter 6 is its home). Prominence: 37 stand out, 18 diluted, 8 buried.
2. **T1:** 1 Missing (no "away", 5); Thin: 84, 109, 128, 172, 246, 342, 516, 541, 544, 554, 558, and 697 (appendix only, a prior-art note).
3. **Most of the buried and diluted T0s are fixed by a paragraph break or a move, with no new words.** The list is below.
4. **Four places where the book and the index now disagree.** These need a decision, not an edit.

## Decisions for Aditya

1. **Chapter 5's new layers paragraph (5:180) contradicts a T0.** index:40 says "What limbo hides was never the misdeed. It's the other person's sameness. The misdeed is what holding that down permits." The paragraph makes the wrong the top layer: "In Chapter 1 I was hiding a wrong. Under that…" It also competes with two other stacks that bottom out differently: 1:212 ("I needed others to carry the darkness I hid from myself") and 6a:48 ("Chapter 1's deepest layer was that I needed my enemy to carry my darkness. Under that was one more: my mind isn't separate from the world"). 5:180 is Claude's draft from November 24 and should change; 6a:48 came in under 2b58e02 (October 17), so check whose it is before touching it.
2. **The choice point (28, 651).** The index says the choice is real only while both pulls are felt, "after that there's no chooser, only reasons", and that the speed of catching it is the measure. 4:21 (Claude, November 24) now says "Staying turned away is work, and it's mine," 4:25 says "Why does the first turn happen at all? I can't give an account of it" (the T0 gives one: the innocent want plus the accumulated ease), and 4:27 puts responsibility in four places. Say which is right; then the index or Chapter 4 changes, and `argument.md` with it.
3. **Where rules come from (128).** The T1 says we build rules "to offload our moral responsibility"; 4:101 says they "exist because people who were sure they had us fully in view didn't." Say which you hold.
4. **Whether Chapter 6 is the home of §11 (552, 554, 558, 109).** If it is, the world-as-stuff T0 is In and stands out at 6:16. If the reader should meet it in the body, the smallest plant is a sentence at 4:122 tying the two trees to "the world held as stuff."

## Fixes by moving or breaking, no new words

T0s first, in book order.

1. **1:147 (index:40, limbo hides the sameness).** Give its last two sentences ("But the perception of our similarity never truly disappears. It only goes into limbo…") their own paragraph.
2. **1:186 (index:208, the leak is the payload).** Move "(Appendix 1 spells this out.)" off the end, so the paragraph ends on "was itself the provocation."
3. **1:233 (index:137, contempt needs no wrongdoer).** Break after "just being honest." and start a new paragraph at "I may even be right about them".
4. **2:44 (index:81, conscience detects the turning, not harm).** End the paragraph after "It is the turning away." and start a new one at "If I'm smarter than others".
5. **2:50 before 2:48 (index:147, size doesn't matter).** Move the bus paragraph up, so the list from the padded expense to "the order to clear a village" runs straight into "tiny beside an atrocity."
6. **2:192 (index:79, reason serves care).** Swap its last two sentences so it ends on "My rational mind must be in service of the orientation, not the other way around."
7. **2:212 (index:593, the light is recognized).** Split before "And what I've been calling *darkness*…"
8. **2:221 (index:31, nothing stays in the skull).** Break before "Part of it I can check."
9. **3:19 (index:271 and 294).** Split after "Believing that, I defend it as myself." Consider cutting its last sentence ("Evil benefits from being seen as a presence, in either direction"; 2:127 carries it; check authorship) and dropping "whole" from 3:15's "So the whole trick", so the book names one trick.
10. **3:45 and 3:47 swapped (index:204, the secret handshake).** The reader finds the eerie sense ("we do it right back at them") before the handshake names it.
11. **3:49–51 up to follow 3:35 (index:352, real/not real, me/not me).** The guards sit together, and 3:47 runs into 3:55's "evil people."
12. **3:146 (index:200, the tug to be recruited).** Split after "we have often spotted evil." so "But the feeling is something else: a tug to be recruited…" stands alone.
13. **3:200 after 3:67 (index:466, the darkest idea).** "That's a version of the darkest idea there is…" lands on the reader's own wood chipper. It also thins the end of The Conspiracy, where 3:196's second sentence (Claude, November 23) restates 3:202 a paragraph early (index:377); cut it after checking authorship.
14. **4:21 (index:28).** Break before "Once the view has gone", after decision 2.
15. **4:49 cut, 4:51 broken (index:418, the far end).** 4:49 is Claude's and repeats 2:153's check; open "The Far End" on the factory-farm worker, and start a paragraph at "My belief is that the most lost person is carrying *more* of that knowledge…"
16. **4:135 (index:320, your own darkness entered the seeing).** Break after "…was in the seeing." so it closes the check.
17. **4:139 (index:486, look at the contempt itself).** Split after "nothing there to fight."
18. **4:158 (index:596, love that needs someone worthless isn't love).** Break before "And it scales." so "…isn't love." closes the paragraph.
19. **5:166–170 to the end of the chapter (index:620 and 566).** "Nothing is lost" now sits as an aside between the ego section and the Zen masters. After the riddle, it follows the layers paragraph, and "The one who was watching—*I*—is ultimately not separate from what the mystics have always called God" becomes the consequence of "I am the world": I can never hide.
20. **6:99 (index:360, every act of contempt feeds it).** Swap its two sentences and give "In this picture, every act of contempt, for anyone, feeds it." its own paragraph as the section's close.

## Thin, needing material

1. **index:663 (T0), it's dangerously naive to pretend they have light.** Only the rule at 4:65. Put the *he's better now* case (now a parenthesis at 4:86) beside it.
2. **index:149 (T0), the "good kind" cover refutes itself.** Its pieces are 100 lines apart (1:94, 1:178, 1:59, 1:204) and no sentence draws the conclusion. End the 1:204 sting check by setting it against 1:94's "good kind." Material: scenarios.md:172.
3. **index:503 (T0, buried), the self-serving default.** It's rung one of the drift ladder at 2:129, so it reads as a step toward evil, not the water everyone swims in, and the reader never checks their own case. Material: index:504's fig leaf ("*this benefits me, but it also helps others*") and index:505's nursing homes and the doctor's one more test.
4. **index:476 (T0), how the felt sense becomes the idea.** Only generic cases (2:118's "a company"). Material: index:106, Sam Bankman-Fried. With it, restore the brilliant-mind trap (T1 544) after 4:122, from `llms/claude-2026-08/short-book/chapter-5.md:23`; that serves 541 too.
5. **index:314 (T0), the angel/devil cartoon.** One foil clause at 3:207. Re-rate to T2 for this book (proposed November 15 as well), or open "From Inside" on the cartoon corrected. Material: `angel-devil-samples.md:119`, "The devil has no eyes. He uses yours."
6. **T1s:** 84, three checks for "in view" (scenarios.md:241; index:85's "he looked me in the eye and did it anyway"); 342, naming it a parasite releases the shame (index:343's F0); 516, the road to hell (the proverb is only a TODO at 2:3); 172 and 246 (the Nov 15 snapshot proposed 172 as an F under 65; 246 could sit beside the wood chipper at 3:61); 5, no "away" (6:63, beside the Bhagirathi villagers).

## Lost and stale

1. **A line in no live home:** "Of **course** it had to feel righteous. Righteousness is what I actually wanted." Chapter 5's holding pen (5:287) says Chapter 6's "The Counterfeit" carries it; it doesn't. It belongs in key-points.
2. **Stale index notes:** 204 (book location), 278 ("not stated as a check"), 280 ("reader's own instance isn't in the book"), 340 (the "What does that sound like to you?" question was restored in 2a10066), 587 (pointer to a Chapter 5 phrase that isn't there).
3. **The ideology test** (scenarios 4.13: "Does it tell you what to do to the person in front of you before you've looked at them?") was cut from Chapter 4 as an echo of Chapter 2, but Chapter 2 doesn't carry it (index:125).

## The full table

Index order. S = stands out, B = buried, D = diluted.

| Index | Tier | Point | Weight | Prominence | Anchor | Note |
|---|---|---|---|---|---|---|
| 3 | T0 | Turned away means already self-deceived | In | S | 3:215 | Closes "From Inside"; seeded 1:14 |
| 5 | T1 | No "away," only someone's backyard | Missing | — | — | Home: 6:63 |
| 7 | T1 | Losing respect isn't necessarily contempt | In | — | 1:233 | |
| 23 | T0 | Can't knowingly harm without turning away | In | S | 2:17 | Run as an exercise |
| 28 | T0 | Choice real only while both pulls are felt | In | D | 4:21 | Text diverges from index (decision 2) |
| 31 | T0 | Nothing stays in the skull, three distances | In | S / D / S | 1:134; 2:221; 5:168 | Distance 2 diluted; distance 1's "that's how you learned it" not drawn (material 4:154) |
| 40 | T0 | Limbo hides their sameness, not the misdeed | In | D | 1:147 | Contrast never drawn; 5:180 contradicts (decision 1) |
| 42 | T0 | "Unconscious" for me, "conscious" for them | In | S | 1:167 | Also 4:34 |
| 44 | T0 | Layers; it uses me as its vehicle | In | S | 3:43 | Three ladders name different rungs (1:212, 3:43, 5:180) |
| 50 | T0 | You can't choose to turn away | In | S | 4:17 | |
| 52 | T1 | Turning away takes upkeep | In | — | 2:159 | |
| 65 | T1 | License: I've been hurt, so I've earned it | In | — | 3:73 | |
| 73 | T0 | Conscience doesn't argue | In | S | 1:26 | Answered 1:141 |
| 79 | T0 | Reason must serve care | In | B | 2:192 | Clean form only at 6:107 |
| 81 | T0 | Conscience detects the turning, not harm | In | D | 2:44 | Cheat/contempt "one move from two ends" only via 3:41 |
| 84 | T1 | Three checks for "in view" | Thin | — | 2:19 | One criterion of three |
| 93 | T0 | You can't calculate your way to goodness | In | S | 2:122 | Stronger form only at 6:109 |
| 109 | T1 | Metrics as the culture trusting thought | Thin | — | 2:118; 6:38 | In if Chapter 6 is home |
| 112 | T1 | "If the light were real, we'd prove it" | In | — | 2:139 | |
| 114 | T1 | Does the plan need contempt for here, now? | In | — | 4:122 | |
| 116 | T1 | Same act, different orientation | In | — | 4:88 | |
| 121 | T0 | Seeing I'm everyone, not trying to be "good" | In | S | 2:188 | |
| 125 | T0 | Ideology is care written down | In | S | 2:172 | Test and "carried" wording missing |
| 126 | T0 | Nothing in the book is a rule | In | S | 4:127 | |
| 128 | T1 | Rules as moral escape hatch | Thin | — | 2:174 | Book diverges at 4:101 (decision 3) |
| 135 | T0 | Contempt is evil, not a value judgment | In | S | 2:56 | |
| 137 | T0 | Contempt needs no wrongdoer | In | D | 1:233 | Four claims in one paragraph |
| 145 | T1 | What contempt licenses has no bottom | In | — | 1:78 | |
| 147 | T0 | Size doesn't matter | In | D | 2:52 | "Still shameful to admit" check absent |
| 149 | T0 | The "good kind" cover refutes itself | In (parts) | B | 1:192 | Conclusion never drawn |
| 152 | T0 | Both directions: harm needs turning, and back | In | S | 2:17 | |
| 156 | T1 | How subtle contempt can be | In | — | 1:235 | |
| 163 | T1 | Unloving exposure coerces | In | — | 1:47 | |
| 166 | T1 | We claim to rub noses in it | In | — | 1:159 | |
| 169 | T1 | Anger healthy; contempt rides along | In | — | 4:86 | |
| 172 | T1 | Closes hearts when most needed | Thin | — | 4:69 | |
| 178 | T1 | Fierce is where the darkness gets in | In | — | 4:88 | |
| 180 | T0 | Kind is not nice | In | S | 4:76 | |
| 192 | T0 | Compassion is not wisdom | In | S | 4:99 | Near-repeats 2:122 (the seed) |
| 194 | T1 | Two meanings of "judgment" | In | — | 4:92 | |
| 200 | T0 | Contempt is a tug to be recruited | In | B | 3:146 | |
| 204 | T0 | The secret handshake | In | D | 3:45 | Name before the sense |
| 208 | T0 | The trap in one piece; the leak is the payload | In | D | 1:161; 1:186 | |
| 218 | T1 | Mutual knowing all the way up | In | — | 1:184 | |
| 236 | T1 | Bad faith, and accusing others of it | In | — | 3:142 | |
| 238 | T1 | Intentions don't stay in the skull | In | — | 2:221 | |
| 242 | T1 | Any agenda, compassion or contempt | In | — | 4:112 | |
| 244 | T1 | Why contempt scales: the spectator seat | In | — | 2:95 | "Uniquely scales" argument absent |
| 246 | T1 | Last evil still praised as goodness | Thin | — | 6:87 | Body home beside 3:61 |
| 253 | T0 | We shame them because it makes them dig in | In | S | 1:102 | |
| 266 | T0 | Why stop corruption when judging feels good? | In | S | 1:132 | |
| 271 | T0 | Contempt makes them unsafe to look | In | D | 3:19 | |
| 278 | T0 | Could you shove the possessed deeper? | In | S | 3:57 | |
| 280 | T1 | The write-off | In | — | 4:129 | |
| 282 | T1 | The special privilege | In | — | 1:49 | |
| 294 | T0 | Its trick: intrinsic in others, absent in me | In | D | 3:19 | Said six times; three "tricks" named |
| 302 | T1 | It manufactures the terror it feeds on | In | — | 3:17 | |
| 304 | T0 | The two taunts | In | S | 1:108; 2:141 | Parasite's own line absent |
| 306 | T0 | Goal: no light; indirection; borrowed reason | In | S | 6:83; 2:190 | |
| 310 | T1 | The price seen honestly | In | — | 3:15 | |
| 312 | T1 | Feeds on pain, confusion, insecurity | In | — | 3:73 | |
| 314 | T0 | The angel/devil cartoon | Thin | B | 3:207 | Re-rate? |
| 320 | T0 | Another's darkness looks intrinsic: yours entered the seeing | In | B | 4:135 | |
| 326 | T1 | Fear of bad essence keeps the turning | In | — | 3:17 | |
| 330 | T0 | Acting from limbo spreads it, knowingly | In | S | 1:102 | |
| 332 | T1 | Can't undo turning away by turning away | In | — | 4:44 | |
| 336 | T1 | A parasite masquerading as us | In | — | 3:13 | |
| 342 | T1 | Naming it a parasite releases the shame | Thin | — | 3:35 | Material index:343 |
| 345 | T1 | Hot and cold, same parasite | In | — | 1:231 | |
| 348 | T1 | Self-cherishing: ego defending the exception | In | — | 3:41 | |
| 352 | T0 | Real/not real, me/not me | In | D | 3:33; 3:51 | Guards split |
| 360 | T0 | Every act of contempt feeds the Devil | In (Picture) | D | 6:99 | |
| 362 | T0 | Our parasites are collaborating | In | S | 3:144 | |
| 377 | T0 | The noble fighter is the conspiracy | In | D | 3:202 | 3:196 says it early |
| 384 | T0 | One distributed entity: the Devil | In (Picture) | S | 6:67 | |
| 399 | T0 | Evil is the result of shielding | In | S | 2:155 | 3:9's "it" reads against it |
| 410 | T0 | All evil is ultimately innocent | In | S | 1:220 | |
| 418 | T0 | The far end: hostage at the window | In | D | 4:59 | 4:49 repeats 2:153 |
| 421 | T1 | The dumping ground | In | — | 3:61 | |
| 427 | T1 | "Oh, boo hoo, he was abused" | In | — | 4:38 | |
| 430 | T1 | The sadist is deep limbo | In | — | 4:42 | |
| 432 | T1 | Contempt from below; self-contempt | In | — | 3:162 | |
| 434 | T1 | It needs some people irredeemable | In | — | 1:118 | |
| 444 | T0 | Feeling like "good people" keeps the door open | In | S | 2:190 | |
| 466 | T0 | The darkest idea: round up the bad people | Thin | D | 3:200 | Move after 3:67 |
| 476 | T0 | Two meanings of "righteous" | In (split) / Thin (example) | S | 2:172 | SBF absent |
| 484 | T0 | Keep everything, give up the contempt? | In | S | 3:152 | |
| 486 | T0 | Look at the contempt as it lands | In | D | 4:139 | "What's it made of" four times, four findings |
| 488 | T1 | Culture still calls it righteous | In | — | 3:61 | |
| 491 | T1 | Accurate sight gets harvested | In | — | 3:146 | |
| 493 | T1 | Contempt for people with contempt; pity | In | — | 4:163 | |
| 503 | T0 | Most activity is self-serving | In | B | 2:129 | Reader never checks own case |
| 507 | T1 | The thrill of getting away with it | In | — | 2:219 | |
| 512 | T1 | Easy in enemies, hard in me | In | — | 2:116 | |
| 516 | T1 | The road to hell | Thin | — | 2:114 | Proverb only a TODO |
| 524 | T1 | Just enough evidence to muddy the waters | In | — | 2:81 | |
| 531 | T0 | Shadow spaces | In | S | 3:124 | "Shadow space" named mid-paragraph at 3:109 |
| 536 | T1 | Biosphere collapse as self-deception | In (Picture) | — | 6:61 | |
| 539 | T1 | Reality nudged to reflect otherness | In (Epilogue) | — | 6a:17 | |
| 541 | T1 | Darkness at scale through what's built | Thin | — | 2:118 | |
| 543 | T1 | Contempt for a neighbor, atrocity abroad | In (Picture) | — | 6:55 | |
| 544 | T1 | A brilliant mind builds an admired trap | Thin | — | 6:47 | |
| 546 | T1 | My default, like jaundice | In | — | 3:215 | |
| 552 | T0 | The world held as lifeless stuff | Thin in body | S | 6:16 | Decision 4 |
| 554 | T1 | The tree and the arch | Thin (Ch 6 only) | — | 6:6 | Moved there on purpose |
| 556 | T1 | We are the world | In (Picture) | — | 6:63 | |
| 558 | T1 | Reality inert, people held that way | Thin | — | 6:24 | |
| 566 | T0 | Compassion is the nature of mind (I = the world = God = Love) | In | D | 5:75; 5:180 | Chain never said in one place; fix 19 |
| 587 | T0 | The darkness neuters good: "who's to say?" | In | S | 2:143 | |
| 591 | T0 | Who decides what's good | In | S | 2:178 | Practical form thin |
| 593 | T0 | The light is recognized, never calculated | In | D | 2:212 | Use-on-the-powerful half missing |
| 596 | T0 | Can't turn toward one and away from another | In | B | 4:158 | |
| 597 | T0 | Love is the first look, held | In | S | 5:71 | |
| 602 | T1 | The traditions at their best, usurped | In | — | 4:163 | |
| 604 | T1 | Our contempt is a symptom | In | — | 3:55 | |
| 606 | T1 | Tier III is the same road | In | — | 5:44 | Method note |
| 611 | T1 | The diver: Darwin explains Love | In (Epilogue) | — | 6a:32 | |
| 614 | T1 | Not reached by thinking harder | In | — | 5:22 | |
| 620 | T0 | Nothing is lost, witnessed or not | In | B | 5:168 | Fix 19 |
| 630 | T1 | Connection relegated to "the spiritual" | In (Picture) | — | 6:71 | |
| 637 | T1 | Angry correction, then wiser | In | — | 4:103 | |
| 639 | T0 | Turning toward doesn't feed it | In | S | 4:167 | |
| 651 | T0 | Not-seeing isn't chosen; catching is trainable | In | S | 4:27 | Text diverges (decision 2) |
| 654 | T0 | Held in Love so I could look | In | S | 5:68 | |
| 663 | T0 | Naive to pretend they have light | Thin | S | 4:65 | |
| 669 | T1 | Rage at the harm vs at the face | In | — | 4:131 | |
| 671 | T1 | The near end: catch the wanting | In | — | 4:137 | |
| 679 | T1 | Judgment day is now | In (Epilogue) | — | 6a:72 | |
| 684 | T0 | Cruelty "works," and adds darkness | In | S | 1:102 | |
| 689 | T1 | The second stranger as pointing-out | In | — | 1:67 | |
| 693 | T1 | Putting it into language | In | — | preface:13 | Purpose, not claim |
| 695 | T1 | Why nobody said it | In | — | 4:34 | |
| 697 | T1 | Projective identification | Thin (appendix) | — | appendix-3:58 | Re-rate as an audit note |
| 699 | T1 | Function decides placement | In | — | 1:5 | Method note |
| 701 | T1 | Explicit and early differ | In | — | 1:5 | Method note |
| 705 | T0 | It can't be told; you find you knew | In | S | preface:21 | |
