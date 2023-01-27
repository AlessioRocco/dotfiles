local telescope = require 'telescope'
local actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_ignore_patterns = {
      '^spec/cassettes/',
      '^db/migrate/',
    },
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<C-h>"] = "which_key"
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

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,
  { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status,
  { desc = '[S]earch Git [S]tatus' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
  { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,
  { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
  { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
  { desc = '[S]earch [H]elp' })

-- Extensions
telescope.load_extension 'fzy_native'
