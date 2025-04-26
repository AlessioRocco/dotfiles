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
