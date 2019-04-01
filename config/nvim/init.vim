""" Plugins

call plug#begin()
" Make sure you use single quotes

Plug 'morhetz/gruvbox'                " Retro groove color scheme for Vim

" Initialize plugin system
call plug#end()

""" General

let g:mapleader = ","                 " Set leader key to ','
set clipboard+=unnamed                " Copy and Paste from the system clipboard
set list listchars=tab:»·,trail:·     " Display extra whitespace
set mouse=a                           " Enable mouse
set wildmode=list:longest,full        " Command Line configurations

"" Number column preferences
set number                            " Use absolute line numbers column
set numberwidth=5                     " Change line numbers column width

"" Theme preferences
set termguicolors                     " Set up true color support
colorscheme gruvbox                   " Set gruvbox as default theme

