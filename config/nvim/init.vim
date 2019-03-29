""" Plugins

call plug#begin()
" Make sure you use single quotes

Plug 'morhetz/gruvbox'                " Retro groove color scheme for Vim

" Initialize plugin system
call plug#end()

""" General

let g:mapleader = ","                 " Set leader key to ','

"" Theme preferences
set termguicolors                     " Set up true color support
colorscheme gruvbox                   " Set gruvbox as default theme
