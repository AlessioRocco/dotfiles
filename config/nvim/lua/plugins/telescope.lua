return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gc", false },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^spec/cassettes/",
        },
        path_display = { "truncate" },
      },
    },
  },
}
