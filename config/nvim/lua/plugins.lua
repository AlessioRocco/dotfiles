local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'            -- use-package inspired plugin/package management for Neovim.
  use 'christoomey/vim-tmux-navigator'    -- Seamless navigation between tmux panes and vim splits
  use 'cohama/lexima.vim'                 -- Automatically closing pair stuff
  use 'tpope/vim-bundler'                 -- bundler.vim: Lightweight support for Ruby's Bundler
  use 'tpope/vim-commentary'              -- commentary.vim: comment stuff out
  use 'tpope/vim-rhubarb'                 -- rhubarb.vim: GitHub extension for fugitive.vim
  use 'tpope/vim-surround'                -- surround.vim: quoting/parenthesizing made simple
  use 'EdenEast/nightfox.nvim'            -- A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins.

  -- Leap is a general-purpose motion plugin for Neovim
  use {
    'ggandor/leap.nvim',
    config = [[require('plugins.leap')]]
  }

  use {
    'tpope/vim-fugitive',
    config = [[require('plugins.fugitive')]]
  }

  -- Run your tests at the speed of thought
  use {
    'janko/vim-test',
    config = [[require('plugins.vim_test')]],
    setup = [[require('plugins.vim_test_setup')]],
  }

  -- EditorConfig plugin for Vim http://editorconfig.org
  use {
    'editorconfig/editorconfig-vim',
    config = [[require('plugins.editorconfig')]]
  }

  -- Projectionist provides granular project configuration using "projections"
  use {
    'tpope/vim-projectionist',
    config = [[require('plugins.projectionist')]]
  }

  -- rails.vim are Ruby on Rails power tools
  use {
    'tpope/vim-rails',
    config = [[require('plugins.rails')]]
  }

  -- A vim-vinegar like file explorer that lets you edit your filesystem like a
  -- normal Neovim buffer.
  use {
    'stevearc/oil.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('plugins.oil')]]
  }

  -- Lualine is a blazing fast and easy to configure Neovim statusline written in Lua.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require('plugins.lualine')]]
  }


  -- Neoscroll is a smooth scrolling neovim plugin written in lua
  use {
    'karb94/neoscroll.nvim',
    config = [[require('plugins.neoscroll')]]
  }

  -- gitsigns is a super fast git decorations implemented purely in lua/teal
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('plugins.gitsigns')]],
  }

  -- nvim-lspconfig is a collection of common configurations for Neovim's built-in language server client
  use {
    'neovim/nvim-lspconfig',
    config = [[require('plugins.lsp_config')]],
  }

  -- LuaSnip
  use {
    'L3MON4D3/LuaSnip',
    config = [[require('plugins.luasnip')]],
    requires = {
      'rafamadriz/friendly-snippets'
    }
  }

  -- nvim-cmp is a completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced"
  use {
    'hrsh7th/nvim-cmp',
    config = [[require('plugins.cmp')]],
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- williamboman/nvim-lsp-installer is a Neovim plugin that allows you to seamlessly install LSP servers locally (inside :echo stdpath("data"))
  use {
    'williamboman/nvim-lsp-installer',
    config = [[require('plugins.lsp_installer')]],
  }

  -- nvim-treesitter is a Treesitter configurations and abstraction layer for Neovim
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugins.treesitter')]],
    setup = [[require('plugins.treesitter_setup')]],
  }

  -- telescope.nvim is a highly extendable fuzzy finder over lists
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    wants = {
      'plenary.nvim',
      'telescope-fzy-native.nvim',
    },
    setup = [[require('plugins.telescope_setup')]],
    config = [[require('plugins.telescope')]],
    cmd = 'Telescope',
    module = 'telescope',
  }

  -- WhichKey is a Lua plugin that displays a popup with possible key bindings
  -- of the command you started typing
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
