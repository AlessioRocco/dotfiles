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
  local abs_path = vim.api.nvim_buf_get_name(0)
  local relpath = vim.fn.fnamemodify(abs_path, ":.")
  vim.fn.setreg("+", relpath)
  vim.notify("Copied: " .. relpath)
end, { desc = "Copy relative file path" })

-- Copy current file relative path and cursor line to clipboard
vim.keymap.set("n", "<leader>fY", function()
  local abs_path = vim.api.nvim_buf_get_name(0)
  local relpath = vim.fn.fnamemodify(abs_path, ":.")
  local line = vim.fn.line(".")
  local result = string.format("%s:%d", relpath, line)
  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end, { desc = "Copy relative file path and position" })
