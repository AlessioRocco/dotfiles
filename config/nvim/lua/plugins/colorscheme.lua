return {
  -- Nightfox
  -- A highly customizable theme for vim and neovim with support for lsp,
  -- treesitter and a variety of plugins.
  -- https://github.com/EdenEast/nightfox.nvim
  { "EdenEast/nightfox.nvim" },

  -- Configure LazyVim to load Nordfox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "Nordfox",
    },
  },
}
