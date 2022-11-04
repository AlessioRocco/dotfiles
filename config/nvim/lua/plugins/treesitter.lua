local treesitter = require 'nvim-treesitter.configs'

treesitter.setup{
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = {                    -- Enable highlighting
    enable = true,
  },
  indent = {
    enable = true,                 -- Enable indentation
  }
}
