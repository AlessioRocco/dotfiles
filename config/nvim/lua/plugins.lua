local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'            -- use-package inspired plugin/package management for Neovim.
  use 'airblade/vim-gitgutter'            -- A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
  use 'christoomey/vim-tmux-navigator'    -- Seamless navigation between tmux panes and vim splits
  use 'cohama/lexima.vim'                 -- Automatically closing pair stuff
  use 'editorconfig/editorconfig-vim'     -- EditorConfig plugin for Vim http://editorconfig.org
  use 'janko/vim-test'                    -- Run your tests at the speed of thought
  use 'justinmk/vim-sneak'                -- The missing motion for Vim
  use 'edkolev/tmuxline.vim'              -- Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
  use 'scrooloose/nerdtree'               -- A tree explorer plugin for (neo)vim
  use 'Xuyuanp/nerdtree-git-plugin'       -- A plugin of NERDTree showing git status
  use 'terryma/vim-smooth-scroll'         -- Make scrolling in Vim more pleasant
  use 'tpope/vim-bundler'                 -- bundler.vim: Lightweight support for Ruby's Bundler
  use 'tpope/vim-commentary'              -- commentary.vim: comment stuff out
  use 'tpope/vim-fugitive'                -- fugitive.vim: a Git wrapper so awesome, it should be illegal
  use 'tpope/vim-rails'                   -- rails.vim: Ruby on Rails power tools
  use 'tpope/vim-rhubarb'                 -- rhubarb.vim: GitHub extension for fugitive.vim
  use 'tpope/vim-surround'                -- surround.vim: quoting/parenthesizing made simple
  use 'vim-airline/vim-airline'           -- Lean & mean status/tabline for vim that's light as air
  use '~/Documents/DraculaPRO/themes/vim' -- Install Dracula PRO theme

  -- nvim-treesitter is a Treesitter configurations and abstraction layer for Neovim
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugins.treesitter')]],
  }

  -- telescope.nvim is a highly extendable fuzzy finder over lists
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim'
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
