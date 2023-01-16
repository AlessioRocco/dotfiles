vim.g.mapleader = " "                             -- Leader
vim.keymap.set('n', '<leader>Q', ':quitall<cr>')  -- Exit NeoVim
vim.keymap.set('n', '<leader>q', ':bd<cr>')       -- Close buffer
vim.keymap.set('n',  '<leader>f', 'gg=G')         -- Reindent the entire file
vim.keymap.set('n',  '<leader><leader>', '<c-^>') -- Easy toggle between the current and the alternate file

-- Set movement keys to move by virtual line, i.e. get around wrapped lines
vim.keymap.set({ 'n', 'v' } , 'j', 'gj')
vim.keymap.set({ 'n', 'v' } , 'k', 'gk')

vim.keymap.set({ 'n', 'v' } , '$', 'g$')
vim.keymap.set({ 'n', 'v' } , '0', 'g0')

-- 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
-- This also catches up with 'C', which changes to the end of the line.
-- Also, do the exact same thing with 'Y'.
vim.keymap.set('n', 'D', 'd$')
vim.keymap.set('n', 'Y', 'y$')

-- H and L in order to move to the beginning/ending of the current line
vim.keymap.set({ 'n', 'v' } , 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', 'g_')

-- Keep search matches in the middle of the screen and open just enough folds to
-- make the line in which the cursor is located not folded
vim.keymap.set({ 'n', 'v' } , 'n', 'nzzzv')
vim.keymap.set({ 'n', 'v' } , 'N', 'Nzzzv')

-- Don't yank to default register when changing something
vim.keymap.set({ 'n', 'x' } , 'c', '"xc')

-- Split and resize panes
vim.keymap.set('n', '<leader>|', ':vsplit<cr>')
vim.keymap.set('n', '<leader>-', ':split<cr>')

vim.keymap.set('n', '<Right>', '<cmd>vertical-resize -1<cr>')
vim.keymap.set('n', '<Left>', '<cmd>vertical-resize +1<cr>')
vim.keymap.set('n', '<Up>', '<cmd>resize +1<cr>')
vim.keymap.set('n', '<Down>', '<cmd>resize -1<cr>')

-- Terminal
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')
