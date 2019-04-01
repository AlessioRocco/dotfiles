""" Plugins

call plug#begin()
" Make sure you use single quotes

Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'editorconfig/editorconfig-vim'  " EditorConfig plugin for Vim http://editorconfig.org
Plug '/usr/local/opt/fzf'             " fzf love vim
Plug 'junegunn/fzf.vim'               " fzf love vim
Plug 'morhetz/gruvbox'                " Retro groove color scheme for Vim
Plug 'scrooloose/nerdtree'            " A tree explorer plugin for (neo)vim.
Plug 'sheerun/vim-polyglot'           " A solid language pack for Vim.
Plug 'tpope/vim-commentary'           " commentary.vim: comment stuff out
Plug 'tpope/vim-fugitive'             " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-surround'             " surround.vim: quoting/parenthesizing made simple
Plug 'vim-airline/vim-airline'        " Lean & mean status/tabline for vim that's light as air

" Initialize plugin system
call plug#end()

""" General

let g:mapleader = ","                 " Set leader key to ','
set clipboard+=unnamed                " Copy and Paste from the system clipboard
set list listchars=tab:»·,trail:·     " Display extra whitespace
set mouse=a                           " Enable mouse
set shell=/bin/sh                     " Use sh as default shell
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

""" Plugins

"" Airline
let g:airline_powerline_fonts = 1

"" NERDTree
let NERDTreeAutoDeleteBuffer = 1      " Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeMinimalUI = 1             " Disable 'Press ? for help' text

""" Keymaps

"" NERDTree
nnoremap \ :NERDTreeToggle<cr>

"" FZF
nnoremap <C-p> :Files<cr>
nnoremap <C-t> :Buffers<cr>
