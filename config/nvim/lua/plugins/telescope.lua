local telescope = require 'telescope'
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    file_ignore_patterns = {
      '^spec/cassettes/',
      '^db/migrate/',
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
    path_display = { 'truncate' },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  }
}

-- Extensions
telescope.load_extension 'fzy_native'
