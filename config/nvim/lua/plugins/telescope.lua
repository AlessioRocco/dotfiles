return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^spec/cassettes/",
          "^db/migrate/",
        },
        path_display = { "truncate" },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
      },
    },
  },
}
