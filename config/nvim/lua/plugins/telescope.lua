local telescope = require 'telescope'
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    path_display = { 'truncate' },
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
