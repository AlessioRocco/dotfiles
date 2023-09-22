return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzy-native.nvim",
      config = function()
        require("telescope").load_extension("fzy_native")
      end,
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^spec/cassettes/",
          "^db/migrate/",
        },
        mappings = {
          i = {
            ["<Esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
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
