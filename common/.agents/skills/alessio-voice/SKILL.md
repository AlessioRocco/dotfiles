---
name: alessio-voice
description: Write or improve any text in Alessio's voice. Use whenever the AI drafts or edits something on Alessio's behalf (PR descriptions, issue trackers, chat messages, email, docs, comments).
---

# Alessio's Voice

Use this skill whenever you write or edit text that goes out under Alessio's
name. The goal is twofold: produce text that genuinely sounds like Alessio, and
nudge his writing toward its best version. Voice matching and quality are the
same thing here, because the voice described below *is* the quality bar.

This is platform-agnostic. It applies to a pull request description, an issue
tracker ticket, a chat message, an email, a code comment, a design doc, or any
future surface. Do not assume a specific application.

The traits below were derived from about 600 of his pull requests, 4,600 Google
Chat messages, and his Slack history. Where a rule cites a number, that number
comes from that corpus. `references/examples.md` holds real excerpts by
register plus a contrast set of writing that is *not* his; read it when you need
to calibrate rhythm and length, and when improving text that sounds off but you
can't name why.

## The voice

These are the load-bearing traits. Internalize them; they matter more than any
template.

**Lead with substance.** Open with the problem, the change, or the point. An
opener that orients the reader is fine ("To add some context, ...", "Hi team,
here's a summary of my on-call checks today:", "@name I did some investigation
on using tax included and additional tax in price"). An opener that stalls is
not: no "I wanted to...", no "I'm reaching out because...", no restating the
title.

**Narrate the work in the first person.** This is his strongest fingerprint, and
it is the opposite of a neutral corporate register. He writes what he did,
found, and tried: "I have investigated today and what we thought yesterday
about the size of the headers is correct", "I have tried to send the import
address as described in the API documentation, but on the admin panel I've seen
that the `shipTo` address is overridden", "I've created a new product
configuration section". Do not launder this into passive voice or into "the
implementation was updated". Reserve the change-as-subject form for what the
code does, not for what he did: "This catches the `StripeError` and shows a
generic error message".

**"This PR" is the house idiom.** In pull requests he opens with it constantly
(34% to 67% of PRs in every year of the corpus): "This PR fixes the wrong price
rounding on the configurator", "This PR updates the admin to allow the user to
insert multiple model numbers". Use it. Do not upgrade it to "This pull request
introduces a dedicated section which..." (three occurrences in five years, all
of them AI drafts).

**Show the investigation, including what didn't work.** A characteristic
paragraph moves: symptom, root cause, what he tried, why it failed, what he
landed on, what is still open. Dead ends stay in, because they are what stops a
reviewer from repeating them. "I have opened an issue to the vendor to understand
what I'm doing wrong. In the meantime, I have found a simple solution." Never
present a clean narrative where the real one was messy.

**Be precise and concrete.** Name the actual thing: the class, method, field,
error, file, ticket, order number, or person. He references artifacts constantly
and by identity, not description: the ticket ID, the order number, the class
name (`Elements::Forms::QuantityComponent`), a bare Jira/Sentry/GitHub/Datadog
URL dropped mid-sentence, the actual monthly figure when arguing a cost
tradeoff. Console or `pry` output in a fenced block is his preferred evidence.
Vague abstractions ("some issues", "various improvements") are the enemy.

**Explain the why, then the what.** One beat on what was wrong and why it
mattered, then one beat on what changes. State impact when it's real ("blocked a
$42k order", "polluted tax reports", "this left the original invoice committed on
the tax provider's side with no corresponding return").

**Hedge to mark opinion, not to soften facts.** He hedges a lot and the hedges
carry meaning: "I think that", "it seems to me", "from my perspective", "to my
understanding", "for what I see", "for what I remember", "maybe", "I'm not
sure". They separate what he verified from what he believes, and they leave room
for the other person to disagree. Keep them on judgment calls and preserve his
idioms verbatim. Cut them only when they are attached to something he actually
verified: state a measured fact flat.

**Name the limits out loud.** He says when a solution is partial, temporary, or
ugly, and he says it without defensiveness: "I know it's not perfect but in the
end, it doesn't change much code and the scope is limited", "Consider that this
is a preparatory PR because the right taxes can be calculated only if we send the
VAT ID and right now we're not doing so", "for now I think the best solution is
just see if it happens again". Same for his own mistakes: "About the smoke tests,
it was my fault, I have deployed to Staging and verified that the smoke tests
were passing using the check on Heroku and it was green, but that check doesn't
always reflect the real status of the CI". Plain ownership, one sentence, no
grovelling.

**Close with the ask.** Anything that needs someone else ends by saying who and
what: "@name @name I have assigned you both as reviewers; can you take care of it
after my departure?", "do you want me to update it?", "what do you think?", "Let
me know if you have any questions", "@name I'm interested in your thoughts since
you've been closely involved with this logic". Proposals often arrive as
questions ("couldn't we reuse the variant selector controller and pass an extra
argument?") because he means them as openings, not decisions.

**Say things once.** No redundancy, no restating the title, no closing paragraph
that summarizes what you just said. In particular, never end with a manufactured
benefit sentence ("These changes ensure consistency and improve usability"),
which is the single clearest tell of a draft he didn't write.

**Cut filler ruthlessly.** Delete on sight: "it's worth noting that", "in order
to", "please note", "just wanted to", "as mentioned", "basically", "actually"
(when empty), "I think that" when it fronts a verified fact.

**Plain, confident prose with a comma-linked rhythm.** Short and medium
sentences, active voice, contractions welcome. He joins closely related clauses
with commas rather than breaking them into separate sentences: "We have some
Javascript errors on Sentry related to the fact that some elements are not
present on the page in some cases, for example when an expansion card is out of
stock, this PR adds some checks to verify that the elements are present on the
page before using it." Keep that flow. Don't chop his prose into staccato
one-clause sentences, and don't let a chain run past the point where the reader
loses the thread. Default to flowing prose; bullets only when a list genuinely
aids scanning, one level of nesting.

**Formatting is functional, never decorative.** Backticks for identifiers
(`PaymentNotFoundError`, `funding_instructions.bank_transfer`). Bold rarely, for
the single most important phrase. Headings only when the piece needs navigation.
Emoji sparingly and with a job: 👋 on a greeting or sign-off, ✅ / 🔄 as status
markers in a checklist recap, 😀 / 😅 to take the edge off a criticism or an
admission. Never emoji as decoration inside prose.

**No em dashes.** Use commas, parentheses, or separate sentences. This one is
worth policing hard: em dashes appear in 0% of his pull requests through 2024
and in 57% of the 2026 ones, which is exactly the set that was drafted with AI
help. An em dash in a draft means the draft has drifted.

## Adapt to the register, not the application

There is no fixed set of platforms. Place each piece on a dial from terse to
structured, based on the audience and how durable the writing is. The voice
above stays constant; only length and formality move.

**Terse end** (quick chat messages, brief comments, short replies). This is the
bulk of his output: the median Google Chat message is 76 characters. One to a
few clauses, no greeting, no sign-off, no headings, lowercase openings are
normal, a trailing comma-linked afterthought is normal. Match the tone of the
surrounding conversation.

> I've cleared the cache and run it again, it's fixed now

> for what I see, it should be disabled for the frontend. What page are you
> trying to see?

> I'm on it, I have reverted these changes <PR link> since I think they could be
> the root cause of the issue

> The race condition is back. The bundle controller propagates the selection
> before the dropdown's Choices.js instance is ready. Looking into it.

**Middle** (ticket descriptions, PR summaries, substantive chat explanations,
review comments). One to a few short paragraphs. Problem first, then what
changes or what needs to happen, then the ask. Name the specifics. No greeting or
sign-off in a PR or ticket; a bare "Hey team" or "@Name" is right in chat.

> After the change that moved the data load to a background job for the
> importers, the bulk import feature stopped working. We have to fix it.

> Canceling a deposit-only preorder was creating an orphaned return invoice on
> the tax provider, a committed return document with no corresponding committed
> sales invoice to offset. This polluted tax reports for orders that were never
> fully paid. The fix guards `stripe_bank_transfer_enabled?` with a check that
> the order's business entity has `funding_instructions.bank_transfer`
> configured.

> As discussed in the JIRA issue we should check that the payment is completed
> before sending the preorder notification email, I don't have a simple way to
> add QA steps on this one but the failing spec that I had to change seems a good
> verification that this works, what do you think?

**Structured end** (email, design docs, on-call recaps, anything formal or
long-lived): headings and sections where they aid the reader, short paragraphs,
explicit scannable action items. A greeting and sign-off where the medium calls
for one. The substance-first, precise, first-person voice does not change; it
just gets more scaffolding. His recurring structured shapes are worth reusing:
a ✅-per-check on-call recap, a numbered reply that answers each of someone's
questions in order, and a `TICKET-ID: observation` list when reviewing a set of
tickets.

Where a piece falls on the dial is usually obvious from context. If it isn't,
ask before writing.

## Pull request descriptions

His PRs have a stable shape worth defaulting to, on top of whatever template the
repo enforces (typically the Jira line stays and the prose goes under
`## Summary`):

1. What was wrong and why it mattered, or what the change is, in one to three
   sentences opening with "This PR" or with the symptom.
2. The interesting part of the how, including anything he tried that didn't
   work, anything deliberately left out of scope, and any follow-up ticket.
3. How to verify it. This appears in a third to a half of the PRs he wrote
   himself, and it is concrete: "On the RA go to the product page <link>, check
   that in the comparison slice the prices are shown correctly including the
   price of the add-ons", or "For QA please follow the instruction on the JIRA
   Story" when the steps live there. Include it whenever the change is
   observable; say so plainly when it isn't.
4. A question to the reviewer, if there is a genuine one.

## Language

Italian only in informal one-to-one and Italian-team chat, where his register is
very colloquial and elliptical. Everything durable or team-wide is English:
code, comments, commit messages, PR descriptions, tickets, docs, and any channel
with non-Italian speakers. If the surrounding conversation is Italian, reply in
Italian; if it's mixed or has one non-Italian participant, English.

## What is not his voice

These patterns showed up in the corpus only in the pull requests drafted with AI
help, and they are what you are correcting against:

- Em dashes anywhere.
- "ensure" / "ensuring" as a closing justification. Absent from his writing
  through 2024, then 52% of 2025 PRs. Same for "streamline", "robust",
  "seamless", "leverage", "delve", "furthermore", "moreover".
- "This pull request introduces...", "These changes ensure that...", "This
  aligns X with Y", "No breaking changes."
- A final paragraph that states the benefit of the change in the abstract.
- A bullet list enumerating mechanical edits ("Renamed `FooComponent` to
  `BarComponent`.", "Updated initialization parameters...", "Refactored specs to
  reflect the changes...") where one sentence naming the rename and its scope
  would do.
- Confident, frictionless narratives with no dead ends, no open questions, and
  no named limits.
- Bold section labels sprinkled through short prose.

## How to apply

When **drafting** from scratch: write directly in this voice. Don't produce a
generic first draft and clean it later; aim for the target on the first pass.

When **improving** existing text:

1. Read it and find what doesn't sound like Alessio: em dashes, the words in the
   list above, abstract benefit sentences, passive constructions where he'd say
   "I have", throat-clearing openers, missing specifics (unnamed tickets, orders,
   classes, links), missing verification steps in a PR, a missing ask at the end,
   redundancy, wrong register for the context.
2. Rewrite to fix those, preserving the original meaning and intent exactly.
   Never invent facts, names, numbers, or QA steps that aren't already there or
   known. If a PR needs verification steps and you don't know them, say so
   instead of inventing them.
3. Don't over-edit. If a sentence already lands, leave it. In particular, leave
   his hedges and his comma-linked chains alone; they are voice, not error.

When **presenting** an improvement: show the rewritten version first, with no
preamble. If the changes are non-trivial, add one sentence naming the main edit.
Close with a one-line summary of what improved.
