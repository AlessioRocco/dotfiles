vim.g.mapleader = " "                             -- Leader
vim.keymap.set('n', '<leader>Q', ':quitall<cr>')  -- Exit NeoVim
vim.keymap.set('n', '<leader>q', ':bd<cr>')       -- Close buffer
vim.keymap.set('n',  '<leader>f', 'gg=G')         -- Reindent the entire file
vim.keymap.set('n',  '<leader><leader>', '<c-^>') -- Easy toggle between the current and the alternate file

-- Append next line to end of current and keep the cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Move lines of text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

-- Keep scroll in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Don't yank to default register when changing something
vim.keymap.set({ 'n', 'x' } , 'c', '"xc')

-- Don't yank to default register when putting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Don't yank to default register when deleting something
vim.keymap.set({ 'n', 'v' } , '<leader>d', [["_d]])

-- Search and replace the word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Split and resize panes
vim.keymap.set('n', '<leader>|', ':vsplit<cr>')
vim.keymap.set('n', '<leader>-', ':split<cr>')

vim.keymap.set('n', '<Right>', '<cmd>vertical-resize -1<cr>')
vim.keymap.set('n', '<Left>', '<cmd>vertical-resize +1<cr>')
vim.keymap.set('n', '<Up>', '<cmd>resize +1<cr>')
vim.keymap.set('n', '<Down>', '<cmd>resize -1<cr>')

-- Terminal
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')
