local g = vim.g

-- Use neovim terminal as strategy to run tests
g['test#strategy'] = 'neovim'

-- Run test in a vertical split pane
g['test#neovim#term_position'] = 'vsplit'

vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>')
vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<cr>')
vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>')
