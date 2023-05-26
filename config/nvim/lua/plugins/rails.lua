return {
  -- Add Rails.vim
  -- https://github.com/tpope/vim-rails
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
    keys = {
      { "<leader>ra", "<cmd>A<cr>", desc = "Rails: Alternate" },
      { "<leader>rA", "<cmd>AV<cr>", desc = "Rails: Alternate split" },
      { "<leader>rr", "<cmd>R<cr>", desc = "Rails: Relative" },
      { "<leader>rR", "<cmd>RV<cr>", desc = "Rails: Relative split" },
    },
  },
}
