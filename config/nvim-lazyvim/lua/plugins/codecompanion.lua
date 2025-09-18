return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  opts = function()
    return {
      strategies = {
        chat = {
          opts = {
            ---Decorate the user message before it's sent to the LLM
            ---@param message string
            ---@param adapter CodeCompanion.Adapter
            ---@param context table
            ---@return string
            prompt_decorator = function(message, adapter, context)
              return string.format([[<prompt>%s</prompt>]], message)
            end,
          },
          variables = {
            ["jira_issue_context"] = {
              callback = function()
                -- Get current branch name
                local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "")
                -- Extract JIRA issue key (e.g., FWMD-3505)
                local issue = branch:match("([A-Za-z]+%-%d+)")
                if not issue then
                  return "No JIRA issue found in branch name."
                end
                -- Fetch JIRA issue details
                local cmd = string.format("JIRA_PAGER=cat jira issue view %s --comments 100 --plain", issue)
                local jira_context = vim.fn.system(cmd)
                return string.format(
                  [[
JIRA issue context for `%s`:

%s
]],
                  issue,
                  jira_context
                )
              end,
              description = "Shares the JIRA issue context based on the current branch",
              opts = {
                contains_code = false,
              },
            },
            ["previous_commits"] = {
              callback = function()
                local previous_commits = vim.fn.system("get_commits_with_diffs")

                return [[
The following are previous commits in this branch that are not present in `main`.
Each commit includes its commit message and the corresponding code changes (diff).
Commits are separated by a line containing only `---`.

Please use this information as context for understanding the branch history and code evolution.

]] .. previous_commits
              end,
              description = "Shares previous commits and their code changes unique to this branch",
              opts = {
                contains_code = true,
              },
            },
            ["staged_diff"] = {
              callback = function()
                local staged_diff = vim.fn.system("GIT_PAGER=cat git diff --no-ext-diff --staged --no-color")

                return string.format(
                  [[
The following is the diff of all code changes currently staged for commit in this branch:

```diff
%s
```
]],
                  staged_diff
                )
              end,
              description = "Shares the current staged code changes",
              opts = {
                contains_code = false,
              },
            },
          },
        },
      },
      prompt_library = {
        ["Generate a Commit Message"] = {
          strategy = "chat",
          description = "Generate a commit message",
          opts = {
            index = 10,
            is_default = true,
            is_slash_cmd = true,
            short_name = "commit",
            auto_submit = false,
          },
          prompts = {
            {
              role = "user",
              content = function()
                return string.format([[
#{jira_issue_context}
#{previous_commits}
#{staged_diff}

Write a single, high-quality commit message for the staged changes, following these best practices (from https://cbea.ms/git-commit/):

Seven Rules for a Great Commit Message:
1. Separate subject from body with a blank line.
2. Limit the subject line to 50 characters.
3. Capitalize the subject line.
4. Do not end the subject line with a period.
5. Use the imperative mood in the subject line (e.g., "Fix bug", "Add feature").
6. Wrap the body at 72 characters.
7. Use the body to explain what and why, not how.

Checklist for the Commit Message:
- Summarize the change in the subject line (imperative, ≤50 chars).
- In the body, explain what changed and why (focus on reasoning, user/business impact, and context).
- If relevant, mention migration, compatibility, or technical debt.
- Avoid file names, code snippets, ticket numbers, or links unless essential.
- Use clear, concise, and direct language.

Additional Guidance:
- If the change is a refactor, explain the motivation and how it resolves technical debt or aligns with requirements.
- If the change affects data models, APIs, or user flows, describe the migration or transition plan.
- If relevant, mention how legacy data or backward compatibility is handled.
- Do not repeat details from previous commits unless necessary for context.

**Examples of Good Commit Messages:**

```gitcommit
Fix typo in introduction to user guide

Corrected a spelling mistake in the first paragraph of the user guide
to improve clarity for new users.
```

```gitcommit
Refactor authentication logic for clarity

Extract authentication checks into a separate module to improve code
readability and maintainability. This change does not affect user
experience but simplifies future enhancements to the login process.
```

```gitcommit
Add support for bulk user import

Implement functionality to allow administrators to import users in
bulk from a CSV file. This streamlines onboarding for large
organizations and reduces manual entry errors.
```

```gitcommit
Update API endpoints for v2 compatibility

Modify existing endpoints to support API v2, ensuring backward
compatibility with v1 clients. This prepares the system for upcoming
feature releases and minimizes migration risks.
```

Output only the commit message, wrapped in a ```gitcommit``` code block.
]])
              end,
              opts = {
                contains_code = true,
                auto_submit = false,
              },
            },
          },
        },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "cmd:op read op://Nebulab/Gemini/credential --no-newline",
            },
          })
        end,
      },
      extensions = {
        spinner = {},
        history = {
          enabled = true,
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
    }
  end,
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle (CodeCompanion)" },
    { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Prompt Actions (CodeCompanion)" },
    { "<leader>ad", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "Prompt Actions (CodeCompanion)" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
    "franco-ruggeri/codecompanion-spinner.nvim",
  },
}
