return {
  -- Add Rails.vim
  -- https://github.com/tpope/vim-rails
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
    keys = {
      { "<leader>ra", "<cmd>A<cr>", desc = "Alternate" },
      { "<leader>rA", "<cmd>AV<cr>", desc = "Alternate split" },
      { "<leader>rr", "<cmd>R<cr>", desc = "Relative" },
      { "<leader>rR", "<cmd>RV<cr>", desc = "Relative split" },
    },
  },
}
