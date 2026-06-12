return {
  -- translate.nvim
  -- https://github.com/uga-rosa/translate.nvim
  "uga-rosa/translate.nvim",
  cmd = "Translate",
  keys = {
    {
      "<leader>T",
      "<cmd>Translate IT<cr>",
      mode = { "n", "v" },
      desc = "Translate",
    },
  },
}
