-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- H and L in order to move to the beginning/ending of the current line
vim.keymap.set("n", "<S-l>", "$")
vim.keymap.set("n", "<S-h>", "^")
vim.keymap.set("v", "<S-l>", "$")
vim.keymap.set("v", "<S-h>", "^")
vim.keymap.set("o", "<S-l>", "$")
vim.keymap.set("o", "<S-h>", "^")

-- Copy current file relative path to clipboard (without position)
vim.keymap.set("n", "<leader>fy", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:."))
end, { desc = "Copy relative file path" })

-- Copy current file relative path and cursor line to clipboard
vim.keymap.set("n", "<leader>fY", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:.") .. ":" .. vim.fn.line("."))
end, { desc = "Copy filename+line to clipboard" })
