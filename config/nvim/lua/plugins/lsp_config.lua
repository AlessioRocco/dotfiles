local utils = require("utils")
local nnoremap = utils.nnoremap

nnoremap('gd', ':lua vim.lsp.buf.definition()<cr>')
nnoremap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nnoremap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nnoremap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nnoremap('gW', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nnoremap('gR', ':lua vim.lsp.buf.references()<cr>')
nnoremap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nnoremap('K', ':lua vim.lsp.buf.hover()<cr>')
nnoremap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nnoremap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
