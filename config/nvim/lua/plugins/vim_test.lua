local g = vim.g

-- Use neovim terminal as strategy to run tests
g['test#strategy'] = 'neovim'

-- Run test in a vertical split pane
g['test#neovim#term_position'] = 'vsplit'
