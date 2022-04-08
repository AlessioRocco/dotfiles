local g = vim.g
local utils = require("utils")
local nnoremap = utils.nnoremap
local vnoremap = utils.vnoremap
local xnoremap = utils.xnoremap

-- Leader
g.mapleader = ' '

nnoremap('<leader>Q', ':quitall<cr>') -- Exit NeoVim
nnoremap('<leader>q', ':bd<cr>')      -- Close buffer
nnoremap('<leader>f', 'gg=G')         -- Reindent the entire file
nnoremap('<leader><leader>', '<c-^>') -- Easy toggle between the current and the alternate file

-- Set movement keys to move by virtual line, i.e. get around wrapped lines
nnoremap('j', 'gj')
nnoremap('k', 'gk')
vnoremap('j', 'gj')
vnoremap('k', 'gk')

nnoremap('$', 'g$')
nnoremap('0', 'g0')
vnoremap('$', 'g$')
vnoremap('0', 'g0')

-- 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
-- This also catches up with 'C', which changes to the end of the line.
-- Also, do the exact same thing with 'Y'.
nnoremap('D', 'd$')
nnoremap('Y', 'y$')

-- H and L in order to move to the beginning/ending of the current line
nnoremap('H', '^')
nnoremap('L', '$')
vnoremap('H', '^')
vnoremap('L', 'g_')

-- Keep search matches in the middle of the screen
nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')
vnoremap('n', 'nzz')
vnoremap('N', 'Nzz')

-- Don't yank to default register when changing something
nnoremap('c', '"xc')
xnoremap('c', '"xc')

-- Split and resize panes
nnoremap('<leader>|', ':vsplit<cr>')
nnoremap('<leader>-', ':split<cr>')
