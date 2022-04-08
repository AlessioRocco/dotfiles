local treesitter = require 'nvim-treesitter.configs'

treesitter.setup{
  ensure_installed = "maintained", -- Only use parsers that are maintained
  highlight = {                    -- Enable highlighting
    enable = true,
  },
  indent = {
    enable = true,                 -- Enable indentation
  }
}
