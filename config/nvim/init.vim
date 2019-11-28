""" Plugins

call plug#begin()
" Make sure you use single quotes

Plug 'airblade/vim-gitgutter'         " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'cohama/lexima.vim'              " Automatically closing pair stuff
Plug 'editorconfig/editorconfig-vim'  " EditorConfig plugin for Vim http://editorconfig.org
Plug 'janko/vim-test'                 " Run your tests at the speed of thought
Plug '/usr/local/opt/fzf'             " fzf love vim
Plug 'junegunn/fzf.vim'               " fzf love vim
Plug 'justinmk/vim-sneak'             " The missing motion for Vim
Plug 'morhetz/gruvbox'                " Retro groove color scheme for Vim
Plug 'scrooloose/nerdtree'            " A tree explorer plugin for (neo)vim.
Plug 'sheerun/vim-polyglot'           " A solid language pack for Vim.
Plug 'terryma/vim-smooth-scroll'      " Make scrolling in Vim more pleasant
Plug 'tpope/vim-bundler'              " bundler.vim: Lightweight support for Ruby's Bundler
Plug 'tpope/vim-commentary'           " commentary.vim: comment stuff out
Plug 'tpope/vim-fugitive'             " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rails'                " rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rhubarb'              " rhubarb.vim: GitHub extension for fugitive.vim
Plug 'tpope/vim-surround'             " surround.vim: quoting/parenthesizing made simple
Plug 'vim-airline/vim-airline'        " Lean & mean status/tabline for vim that's light as air

" Initialize plugin system
call plug#end()

""" General

let g:mapleader = " "                 " Set leader key to space
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

augroup update_buffers
  au!
  au FocusGained * :checktime          " Auto read buffers when focus is gained
  au FocusLost * wall                  " Auto save buffers when focus is lost
  au BufLeave * wall                   " Write all changed buffers when leaving a buffer.
augroup END

"" Theme preferences
set termguicolors                     " Set up true color support
colorscheme gruvbox                   " Set gruvbox as default theme

""" Plugin Settings

"" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1                " Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#formatter = 'unique_tail'  " Use unique_tail as airline path formatter

"" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']     " Ensure that EditorConfig plugin works well with fugitive

"" NERDTree
let NERDTreeAutoDeleteBuffer = 1      " Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeMinimalUI = 1             " Disable 'Press ? for help' text

""" Keymaps

" jj exits to normal mode
inoremap jj <esc>

" Close buffer.
nnoremap <leader>q :bd<cr>

" Exit NeoVim.
nnoremap <leader>Q :quitall<cr>

" Reindent the entire file
nnoremap <leader>f gg=G

" Easy toggle between the current and the alternate file.
nnoremap <leader><leader> <c-^>

" Set movement keys to move by virtual line, i.e. get around wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap $ g$
nnoremap 0 g0
vnoremap $ g$
vnoremap 0 g0

" 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
" This also catches up with 'C', which changes to the end of the line.
" Also, do the exact same thing with 'Y'.
nnoremap D d$
nnoremap Y y$

" H and L in order to move to the beginning/ending of the current line.
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Don't yank to default register when changing something.
nnoremap c "xc
xnoremap c "xc

" Split and resize panes
nnoremap <leader>\| :vsplit<cr>
nnoremap <leader>- :split<cr>

nnoremap <silent> <Right> :vertical-resize +1<cr>
nnoremap <silent> <Left> :vertical-resize -1<cr>
nnoremap <silent> <Up> :resize +1<cr>
nnoremap <silent> <Down> :resize -1<cr>

"" NERDTree
nnoremap \ :NERDTreeToggle<cr>

"" Fugitive
nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>d :Gvdiff<cr>
nnoremap <leader>c :Gcommit<cr>
nnoremap <leader>b :Gbrowse<cr>

"" FZF
nnoremap <C-p> :Files<cr>
nnoremap <C-t> :Buffers<cr>
nnoremap <C-g> :GitFiles?<cr>
nnoremap <leader>/ :Rg<space>

" Use Esc to kill the fzf buffer (https://github.com/junegunn/fzf.vim/issues/544)
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>

"" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

"" vim-test
nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>

"" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

