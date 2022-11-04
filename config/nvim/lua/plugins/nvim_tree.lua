local nvim_tree = require("nvim-tree")

nvim_tree.setup({
  update_focused_file = {
    enable = true
  }
})

require'nvim-tree.view'.View.winopts.cursorline = true
