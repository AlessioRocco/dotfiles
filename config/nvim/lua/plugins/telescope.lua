return {
  {
    "nvim-telescope/telescope.nvim",
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
