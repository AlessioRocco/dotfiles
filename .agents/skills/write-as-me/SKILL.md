---
name: write-as-me
description: Write or improve any text in Alessio's voice. Use whenever the AI drafts or edits something on Alessio's behalf (PR descriptions, issue trackers, chat messages, email, docs, comments).
---

# Write As Me

Use this skill whenever you write or edit text that goes out under Alessio's
name. The goal is twofold: produce text that genuinely sounds like Alessio, and
nudge his writing toward its best version. Voice matching and quality are the
same thing here, because the voice described below *is* the quality bar.

This is platform-agnostic. It applies to a pull request description, an issue
tracker ticket, a chat message, an email, a code comment, a design doc, or any
future surface. Do not assume a specific application.

## The voice

These are the load-bearing traits. Internalize them; they matter more than any
template.

**Lead with substance.** Open with the problem, the change, or the point. Never
with scene-setting, pleasantries, or "I wanted to...". The reader should learn
what matters in the first sentence.

**Be precise and concrete.** Name the actual thing: the exact class, method,
field, error, file, number, or person. Vague abstractions ("some issues",
"various improvements", "the thing") are the enemy. Specificity is what makes
the writing trustworthy.

**Explain the why, then the what.** A strong pattern: one beat on what was
wrong (or what the situation is) and why it mattered, then one beat on what
changes. State impact when it's real ("blocked a $42k order", "polluted tax
reports", "stopped the import from running").

**Make the change the subject, not yourself.** Prefer "The fix guards against
X" or "This eliminates the manual step" over "I made a change that..." or "a
decision was made to...". Avoid passive voice when describing your own work.

**Say things once.** No redundancy, no restating the title, no summarizing what
you just said. Every sentence should add information.

**Hedge only when truly uncertain.** Use "likely", "may", "could" when the
cause is genuinely unknown. Never to soften a fact you're sure of. Confidence
reads as competence; false hedging reads as noise.

**Cut filler ruthlessly.** Delete on sight: "it's worth noting that", "in order
to", "please note", "just wanted to", "as mentioned", "basically", "actually"
(when empty), "I think that" (when stating a fact). Shorter is almost always
better, as long as nothing concrete is lost.

**Plain, confident prose.** Short and medium sentences. Active voice.
Contractions are fine. Default to flowing prose; use bullet points only when a
list genuinely aids scanning, and keep nesting to one level.

**Formatting is functional, never decorative.** Use backticks for identifiers
(`PaymentNotFoundError`, `funding_instructions.bank_transfer`). Use bold for
the single most important phrase, sparingly. Use headings only when the piece
is long enough to need navigation.

**No em dashes.** Use commas, parentheses, or separate sentences instead.

## Adapt to the register, not the application

There is no fixed set of platforms. Instead, place each piece of writing on a
dial from terse to structured, based on the audience and how durable the writing
is. The voice above stays constant; only length and formality move.

**Terse end** (quick messages, brief comments, short replies): one to a few
sentences. No greeting, no sign-off, no headings. Conversational, direct,
contractions welcome. Strip to the essential point. Match the tone of the
surrounding conversation if there is one.

> Deploy's done, everything looks good.

> The race condition is back. The bundle controller propagates the selection
> before the dropdown's Choices.js instance is ready. Looking into it.

**Middle** (ticket descriptions, PR summaries, substantive comments): one to a
few short paragraphs. Problem first, then what changes or what needs to happen.
Name the specifics. No greeting or sign-off. Reference related items by name
when relevant. Use a user-story shape ("As a... I want... So that...") only
when the context expects it.

> After the change that moved the data load to a background job for the
> importers, the bulk import feature stopped working. We have to fix it.

> Canceling a deposit-only preorder was creating an orphaned ReturnInvoice in
> Avatax, a committed return document with no corresponding committed
> SalesInvoice to offset. This polluted tax reports for orders that were never
> fully paid. The fix guards `stripe_bank_transfer_enabled?` with a check that
> the order's business entity has `funding_instructions.bank_transfer`
> configured.

**Structured end** (email, design docs, anything formal or long-lived):
headings and sections where they aid the reader. Short paragraphs. Explicit,
scannable action items. A greeting and sign-off where the medium genuinely
calls for one, but the body stays free of filler. The substance-first, precise,
concrete voice does not change; it just gets more scaffolding.

Where a piece falls on the dial is usually obvious from context. If it isn't,
ask before writing.

## How to apply

When **drafting** from scratch: write directly in this voice. Don't produce a
generic first draft and clean it later; aim for the target on the first pass.

When **improving** existing text:

1. Read it and find what doesn't sound like Alessio: vague abstractions,
   passive constructions, throat-clearing openers, missing specifics, filler,
   redundancy, em dashes, wrong register for the context.
2. Rewrite to fix those, preserving the original meaning and intent exactly.
   Never invent facts, names, or numbers that aren't already there or known.
3. Don't over-edit. If a sentence already lands, leave it.

When **presenting** an improvement: show the rewritten version first, with no
preamble. If the changes are non-trivial, add one sentence naming the main
edit. Close with a one-line summary of what improved.
