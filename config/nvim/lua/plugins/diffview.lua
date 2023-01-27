require('diffview').setup({
  key_bindings = {
    view = {
      ["q"] = '<cmd>DiffviewClose<cr>',
      ["<esc>"] = '<cmd>DiffviewClose<cr>',
    },
    file_panel = {
      ["q"] = '<cmd>DiffviewClose<cr>',
      ["<esc>"] = '<cmd>DiffviewClose<cr>',
    },
  }
})

vim.keymap.set('n', '<leader>gg', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>')
vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>')
