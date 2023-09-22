return {
  -- Neogit
  -- https://github.com/NeogitOrg/neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    cmd = "Neogit",
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Branch" },
    },
  },
  -- Diffview.nvim
  -- https://github.com/sindrets/diffview.nvim
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff" },
    },
    config = {
      keymaps = {
        view = {
          ["q"] = "<cmd>DiffviewClose<cr>",
          ["<esc>"] = "<cmd>DiffviewClose<cr>",
        },
        file_panel = {
          ["c"] = "<cmd>Neogit commit<cr>",
          ["q"] = "<cmd>DiffviewClose<cr>",
          ["<esc>"] = "<cmd>DiffviewClose<cr>",
        },
      },
    },
  },
}
