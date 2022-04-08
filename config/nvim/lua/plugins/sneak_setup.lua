local g = vim.g
local utils = require("utils")
local nmap = utils.nmap

-- Enable label-mode for a minimalist alternative to EasyMotion
g['sneak#label'] = 1

nmap('f', '<Plug>Sneak_f')
nmap('F', '<Plug>Sneak_F')
nmap('t', '<Plug>Sneak_t')
nmap('T', '<Plug>Sneak_T')
