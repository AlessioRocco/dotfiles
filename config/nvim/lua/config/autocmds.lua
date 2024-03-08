-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Use ctags to jump to the definition in eruby files since Solargraph doesn't
-- work in them.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ctags", { clear = true }),
  pattern = { "eruby" },
  callback = function()
    vim.keymap.set("n", "gd", "<c-]>")
  end,
})
