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

"" Split window preferences
set splitbelow                        " Open new split panes to bottom, which feels more natural
set splitright                        " Open new split panes to right, which feels more natural

"" Wrap line preferences
set nowrap                            " Lines will not wrap and only part of long lines will be displayed
set scrolloff=2                       " Set minimal number of screen lines to keep above and below the cursor
set sidescroll=1                      " Incrementally scroll one character at a time to reveal more text as needed
set sidescrolloff=10                  " Set minimal number of screen columns to keep to the left and to the right of the cursor

"" Searching preferences
set ignorecase                        " Searching is not case sensitive
set smartcase                         " Make search case sensitive only if it contains uppercase letters

"" Autoread and autowrite
set autowrite                         " Write the contents of the file if it has been modified
set autowriteall                      " Like 'autowrite' but also used for commands
set noswapfile                        " Don't create a swapfile for a new buffer
set nowritebackup                     " Don't backup before overwriting a file.
set undofile                          " Automatically save your undo history

" Auto read files when focus is gained
au FocusGained * :checktime

" Auto save files when focus is lost
augroup save
  au!
  au FocusLost * wall
augroup END

"" Theme preferences
set termguicolors                     " Set up true color support
colorscheme gruvbox                   " Set gruvbox as default theme
