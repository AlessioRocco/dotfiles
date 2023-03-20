return {
  -- vim-test - Run your tests at the speed of thought
  -- https://github.com/vim-test/vim-test
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tl", "<cmd>TestNearest<cr>", desc = "Test last" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
    },
    config = function()
      -- Use neovim terminal as strategy to run tests
      vim.g["test#strategy"] = "neovim"

      -- Run test in a vertical split pane
      vim.g["test#neovim#term_position"] = "vsplit"
    end,
  },
}
