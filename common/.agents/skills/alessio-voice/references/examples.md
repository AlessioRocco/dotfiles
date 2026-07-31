# Calibration examples

Real excerpts from Alessio's writing, grouped by register, followed by a contrast
set. Names, links, ticket IDs, order numbers and figures are redacted or
genericized; the wording, rhythm and structure are his.

Read this when a draft is technically fine but the rhythm feels off, and when you
need to judge how long a piece should be.

## Terse: everyday chat

The median chat message is 76 characters. Lowercase openings, comma-linked
afterthoughts, and a trailing question are all normal.

> I've cleared the cache and run it again, it's fixed now

> sure

> I need to fix one flaky spec

> I've interrupted the command, do we usually use `refresh_async`?

> for what I see, it should be disabled for the frontend. What page are you
> trying to see?

> I'm on it, I have reverted these changes <PR link> since I think they could be
> the root cause of the issue

> The JSON file shouldn't come from the translation service but directly from the
> CMS

> I can confirm that is how they are saved in the database, do you want me to
> update it?

> please remember to enable also the ENV variable `FEATURE_PAGE_ENABLED`

> I have the same doubt

> yes sorry, I forgot to update it, give me a second

> the main issue was that we trusted the specs but for that part there are no
> specs since it is really hard to test 😅

> I'm a bit skeptical of the articles coming from the company that sells you
> tokens, especially when they tell you a way to spend more money on tokens 😀

Ritual sign-offs and status notes:

> Signing off, today I have updated the filter by status PR to handle the release
> feature, it's now on review.
> See you next week 👋

> This morning I've done the switch to the new payment method for the Tier 2
> countries, I'm continuing to monitor and see if major issues happen, please
> ping me if you see something strange.

> Hey Team, I'm back from my ⛰️ PTO and I'm ready to have my hands dirty again on
> the code. I will spend some time to catch up on what happened in these two
> weeks; I will also post some pictures on the social channel later!

## Middle: substantive explanation in chat

Two to four paragraphs, first person, hedged where it's opinion, ending in an
ask. Note the willingness to be the one who raises the awkward question.

> @name I've checked the orders and for most of them, the issue was that the VAT
> ID wasn't sent to the tax provider.
>
> I recently worked on a feature that changes where we store the VAT ID and how
> we categorize users. With these changes, the VAT ID is now stored directly on
> the order, and customers are considered regular users even if they have a VAT
> ID. Only the B2B squad can promote a customer to a business user. Here's the
> ticket I worked on: PROJ-1234.
> For the orders in the list, a recalculation was enough to fix the issue, and
> they're all in "Credit Own" now. I'm waiting for confirmation before proceeding
> with the refunds.
> I also ran a query to check for other orders in the same state and found just
> one more, which I've added to the spreadsheet. I'm currently looking into the
> root cause of the issue.
>
> @name tagging you to keep you in the loop in case we need more help
> coordinating with this issue.

> I have investigated today and what we thought yesterday about the size of the
> headers is correct, we had reached the limit by adding all the Google domains:
>
> <docs link>
>
> I have created a PR that I have tested in Staging with only the domains that we
> support and it works, I have also added a "WARNING" comment in the code to avoid
> future issues like this. About the smoke tests, it was my fault, I have deployed
> to Staging and verified that the smoke tests were passing using the check on
> Heroku and it was green, but that check doesn't always reflect the real status of
> the CI, then when I have deployed to Production the smoke and performance test
> was green and I was able to navigate the website, this tricked me more.

> I don't have strong opinions about wrap lines at 80 chars, I usually try to do
> that and in some cases the editor does it for me automatically but adding a
> linter just for that seems too much for me.
> About the `context` I would say that it depends, sometimes I found it useful
> sometimes they bother me because give for example that I'm working on a spec
> like this: [...] and the context is out of my view, I have to scroll back to
> find it to understand the spec, this applies also for other RSpec DSL features,
> this is an article about it <link>, it has also some consideration about
> betterspecs.org that was one of my reference some times ago before I have met
> @name 😀.

> I have a question about the process itself: do we need all those overnight runs?
> We're a small team and we haven't embraced a dark factory pattern (yet), so all
> PRs still need to be reviewed, QAed, and the generated code maintained. That
> adds real cognitive and emotional load on the engineering side, so I'd like to
> understand where the demand is coming from and whether the tradeoff is worth it
> 🤔

Disagreeing about process, using his own experience as the evidence:

> It seems to me that we have moved to an idea that we need a perfect ticket with
> clear outcomes, so we invest a lot of time on refining the tickets and the
> description. In the past, what worked for me was having tickets that could have
> some unknowns in them but had the flexibility to explore the solutions with the
> involved stakeholder.
> This worked for me since most of the time the issues are challenging to predict
> and arise when you put your hand on the ticket. [...]
>
> So my idea is that at the end the outcome wouldn't change much, but the process
> could be smoother. The other side is that we have to accept that on the issues
> there will be some unknowns.

## Middle: pull request summaries

> The prices in the comparison slice on the product page were without the add-ons,
> this PR fixes those prices.
>
> On the RA go to the product page <link>, check that in the comparison slice the
> prices are shown correctly including the price of the add-ons.

> Until now some JS error messages weren't handled and nothing was shown to the
> user, this catch the `StripeError` and the requests that return 500 and shows a
> generic error message to the user.
>
> The simple way to QA this feature is to raise an error inside the
> `Api::StripeGateway::PaymentsController` controller, then try a payment in the
> checkout, you should see the error message `Something went wrong. Please try
> again.`, replicate the same process for the payment completion page, as a plus
> you can verify that the API request to the controller fails with a 500 but
> respond with a JSON instead of an HTML page.

> As discussed in the JIRA issue we should check that the payment is completed
> before sending the preorder notification email, I don't have a simple way to add
> QA steps on this one but the failing spec that I had to change seems a good
> verification that this works, what do you think?
>
> Another step that can be done is to check that the preorder notification email
> is still sent.

The full investigation shape, dead end included:

> After the recent meetings, we have found that in some cases we are applying the
> wrong taxes to the business user, this is happening when a product is shipped
> from the APAC warehouse to a European country, the problem is that the stock
> location is in Taiwan, but the goods are first imported in France and then
> shipped to the customer. To correctly calculate the taxes, and send the right
> data to the tax provider, I have tried to send the import address as described
> in this API documentation <link> but on the admin panel I've seen that the
> `shipTo` address is overridden by the `import` address, I have opened an issue
> to the vendor to understand what I'm doing wrong. In the meantime, I have found
> a simple solution. The solution is to use the `import` address as `shipFrom`
> address, this let the provider calculate the taxes correctly.
>
> Consider that this is a preparatory PR because the right taxes can be
> calculated only if we send the VAT ID and right now we're not doing so.
>
> To simplify the management of the import addresses I have created an admin
> panel, the import address must be also connected to a zone to be used only in
> that specific zone.

Owning an ugly-but-scoped solution:

> This is the fastest and easier way that I could think to implement the requested
> feature, to make it works I've created a new product configuration section with
> the variant that must be added to the configuration when the user selects the
> "both" option, then I've hidden those section in the frontend so we can use it
> just for the business logic. [...]
>
> I know it's not perfect but in the end, it doesn't change much code and the
> scope is limited.
>
> For QA please follow the instruction on the JIRA Story.

## Structured: recaps and formal notes

The on-call recap, one line per check, status emoji as the scan anchor:

> Hi team, here's a summary of my on-call checks today:
>
> ✅ CI Nightly Build: validation-and-analysis workflow passed
> ✅ Sentry Errors: I have resolved two `Rack::Timeout::RequestTimeoutException`
>   - <link>
>   - <link>
> ✅ Latency & Error Rate: We had an increase in error rates and latency around
>   02:40am, nothing to concern.
> ✅ Error Logs (Past 12 Hours): We have a spike in warning logs related to some
>   401, the logs report that the user tried to reach an order without the needed
>   permissions, I wouldn't investigate more for now as the logs are stopped, will
>   see if something change.
> ✅ Cloudflare Attacks: Cloudflare reported a spike in security events that was
>   mitigated.
> ✅ Dependabot Updates: No updates needed <link>.
> ✅ Sample Database Update: Skipped today.

A note that proposes work and closes on a decision question:

> Hey team,
> To help track the recent staging key changes and make future rotations easier,
> I've created a Jira ticket for each service:
>
> <links>
>
> Each ticket includes step-by-step instructions and direct links to the service
> pages for key rotation (these can be tricky to find). I've also documented edge
> cases, like updating the tax provider key on CI. The goal is to make future
> rotations faster and easier, just clone the relevant issue and follow the steps.
> This should save time and let us split the work across the team.
>
> To further streamline things, I've added two rake tasks to copy staging ENV
> variables to our other apps and the review app.
>
> @name @name, do you think we should update the Credential Rotation process to
> reflect these changes?

Reviewing a batch of tickets, one observation per ticket:

> @name I have reviewed the tickets, and I have some observations:
>
> PROJ-1234: To my understanding, the first payment will be triggered directly by
> the ERP using the API that we already have, so the phrase "First attempt on the
> target capture date" seems incorrect to me; the app should manage only the
> retries and not the first attempt.
> PROJ-1234: in the AC we have "If the order was removed from the batch before
> attempting to capture payment.". I think that right now we don't have a way to
> remove a batch from an order using the admin interface; couldn't we just cancel
> the order?
> PROJ-1235: the user story say: "[...]". This applies only to the first payment
> or also to the retries?

## Contrast: this is not his voice

All of these come from PRs drafted with AI help. Each one is fluent and each one
is wrong.

> This pull request introduces a dedicated "AI Integration" section to the README,
> reflecting the project's adoption of AI tools to enhance developer productivity
> and code quality. [...] This prepares the project for future AI tool
> integrations and establishes best practices for their use.

Why it fails: nobody did anything in it. No first person, no specifics, and the
last sentence is a benefit claim rather than information.

> To improve clarity and consistency across the application, the term "Foo" has
> been renamed to "Bar". This change affects various components, services, models,
> views, and controllers. The following updates were made:
>
> - Renamed `FooComponent` to `BarComponent`.
> - Updated initialization parameters and method names.
> - Modified references in views.
> - Refactored specs to reflect the changes.
>
> These changes ensure that the terminology used throughout the codebase is
> consistent and aligns with the updated naming conventions.

Why it fails: "various components" instead of the scope, a bullet list restating
what the diff already shows, an opening purpose clause, and a closing "ensure"
sentence. He would have written one or two sentences naming the rename, the
scope, and anything left behind.

> The filter now uses Ransack's `user_customer_type_eq`, ensuring consistent
> filtering for both business and consumer searches on all pages. [...]
>
> No breaking changes. These updates improve admin usability and search
> consistency.

Why it fails: the specifics are right, but "ensuring" and the two closing
sentences are pure padding. Delete the last paragraph and it is nearly his.

> When an order was canceled, the invoice was voided too early — before payments
> were processed.

Why it fails: the em dash. He uses a comma or a parenthesis here, every time.
