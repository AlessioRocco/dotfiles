return {
  "folke/sidekick.nvim",
  lazy = false,
  opts = function()
    return {
      cli = {
        prompts = {
          commit_message = "Write the commit message based on the staged changes.",
          pull_request = "Write a pull request description based on the commits and changes.",
          refine_workplace_writing = [[Please help improve the following workplace writing. Focus on enhancing readability, tone, and flow while preserving authentic voice and adapting to the appropriate context.

**Guidelines:**

- Prioritize efficiency and deliver quick, natural improvements
- Automatically adapt formatting and style to the platform
- Avoid em dashes (—), use commas, parentheses, and periods instead
- Keep explanations concise and example-based

**Platform-Specific Adaptations:**

- **Commit messages:** Conventional structure with concise summaries
- **Jira issues/QA:** Clear headings, Markdown formatting, step-by-step format
- **Emails:** Professional structure
- **Slack/chat:** Natural, conversational, collegial while staying polite and clear

**Task:** Review and improve the text for clarity, grammar, and appropriate workplace tone. End with a one-line summary of what was improved.

Please paste the text you'd like refined and specify the context (commit message, Slack message, email, Jira issue, etc.) if not obvious.]],
        },
      },
    }
  end,
}
