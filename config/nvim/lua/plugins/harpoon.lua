require("harpoon").setup({
  -- set marks specific to each git branch inside git repository
  mark_branch = true,
})

vim.keymap.set('n', '<leader>m', require("harpoon.mark").add_file,
  { desc = 'Mark file' })
vim.keymap.set('n', '<leader>mm', require("harpoon.ui").toggle_quick_menu,
  { desc = 'View all project marks' })

vim.keymap.set('n', '<leader>j', [[:lua require("harpoon.ui").nav_file(1)<cr>]],
  { desc = 'Navigate to marked file 1' })
vim.keymap.set('n', '<leader>k', [[:lua require("harpoon.ui").nav_file(2)<cr>]],
  { desc = 'Navigate to marked file 2' })
vim.keymap.set('n', '<leader>l', [[:lua require("harpoon.ui").nav_file(3)<cr>]],
  { desc = 'Navigate to marked file 3' })
vim.keymap.set('n', '<leader>;', [[:lua require("harpoon.ui").nav_file(4)<cr>]],
  { desc = 'Navigate to marked file 4' })
