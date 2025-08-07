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
  },
}
