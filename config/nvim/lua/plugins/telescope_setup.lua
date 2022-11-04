local keymap = vim.api.nvim_set_keymap
local options = { noremap = true }

keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', options)
keymap('n', '<C-s>', '<cmd>Telescope git_status<cr>', options)
keymap('n', '<C-t>', '<cmd>Telescope buffers<cr>', options)
keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', options)
keymap('n', '<leader>*', '<cmd>Telescope grep_string<cr>', options)
