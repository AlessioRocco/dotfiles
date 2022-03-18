local keymap = vim.api.nvim_set_keymap
local options = { noremap = true }

keymap('n', '<leader>Q', ':quitall<cr>', options)       -- Exit NeoVim
keymap('n', '<leader>q', ':bd<cr>', options)            -- Close buffer
keymap('n', '<leader>f', 'gg=G', options)               -- Reindent the entire file
keymap('n', '<leader><leader>', '<c-^>', options)       -- Easy toggle between the current and the alternate file

-- Set movement keys to move by virtual line, i.e. get around wrapped lines
keymap('n', 'j', 'gj', options)
keymap('n', 'k', 'gk', options)
keymap('v', 'j', 'gj', options)
keymap('v', 'k', 'gk', options)

keymap('n', '$', 'g$', options)
keymap('n', '0', 'g0', options)
keymap('v', '$', 'g$', options)
keymap('v', '0', 'g0', options)

-- 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
-- This also catches up with 'C', which changes to the end of the line.
-- Also, do the exact same thing with 'Y'.
keymap('n', 'D', 'd$', options)
keymap('n', 'Y', 'y$', options)

-- H and L in order to move to the beginning/ending of the current line
keymap('n', 'H', '^', options)
keymap('n', 'L', '$', options)
keymap('v', 'H', '^', options)
keymap('v', 'L', 'g_', options)

-- Keep search matches in the middle of the screen
keymap('n', 'n', 'nzz', options)
keymap('n', 'N', 'Nzz', options)
keymap('v', 'n', 'nzz', options)
keymap('v', 'N', 'Nzz', options)

-- Don't yank to default register when changing something
keymap('n', 'c', '"xc', options)
keymap('x', 'c', '"xc', options)

-- Split and resize panes
keymap('n', '<leader>|', ':vsplit<cr>', options)
keymap('n', '<leader>-', ':split<cr>', options)
