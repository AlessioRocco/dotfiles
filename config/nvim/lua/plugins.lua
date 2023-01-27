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

  use {
    'tpope/vim-fugitive',
    config = [[require('plugins.fugitive')]]
  }

  -- Run your tests at the speed of thought
  use {
    'janko/vim-test',
    config = [[require('plugins.vim_test')]]
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

  -- gitsigns is a super fast git decorations implemented purely in lua/teal
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('plugins.gitsigns')]],
  }

  -- The purpose of this plugin is to bundle all the "boilerplate code"
  -- necessary to have nvim-cmp (a popular autocompletion plugin) and
  -- nvim-lspconfig working together. And if you opt in, it can use mason.nvim
  -- to let you install language servers from inside neovim.
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Useful status updates for LSP
      {'j-hui/fidget.nvim'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = [[require('plugins.lsp')]],
  }

  -- nvim-treesitter is a Treesitter configurations and abstraction layer for Neovim
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugins.treesitter')]],
    requires = {
      'tree-sitter/tree-sitter-embedded-template'
    },
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
    config = [[require('plugins.telescope')]]
  }

  -- Harpoon - Getting you where you want with the fewest keystrokes.
  use {
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = [[require('plugins.harpoon')]],
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
