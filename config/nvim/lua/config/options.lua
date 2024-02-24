-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "+1" -- Highlight the column next to the textwidth

-- Filetype specific options
vim.filetype.add({
  extension = {
    deface = "eruby",
  },
})
