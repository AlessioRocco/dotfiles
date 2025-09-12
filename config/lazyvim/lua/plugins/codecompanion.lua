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
                local issue = branch:match("([A-Z]+%-%d+)")
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
                local previous_commits = vim.fn.system("get_commits_with_clean_diffs")

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
