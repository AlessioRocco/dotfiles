return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^spec/cassettes/",
          "db/sample.sql",
        },
        path_display = { "truncate" },
      },
    },
  },
}
