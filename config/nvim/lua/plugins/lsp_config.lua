vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>')
vim.keymap.set('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<cr>')
vim.keymap.set('n', 'gR', ':lua vim.lsp.buf.references()<cr>')
vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>')
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
