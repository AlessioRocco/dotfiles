local utils = require("utils")
local nnoremap = utils.nnoremap

nnoremap('<leader>gs', ':Git<cr>')
nnoremap('<leader>gd', ':Gvdiff<cr>')
nnoremap('<leader>gc', ':Gcommit<cr>')
nnoremap('<leader>gb', ':Gbrowse<cr>')
