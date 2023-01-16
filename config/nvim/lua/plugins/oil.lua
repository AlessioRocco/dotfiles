require("oil").setup({
  keymaps = {
    ["<Esc>"] = "actions.close",
  },
})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
