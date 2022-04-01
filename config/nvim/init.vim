lua <<EOF
require('plugins')
require('settings')
require('keybindings')
EOF

augroup update_buffers
  au!
  au FocusGained * :checktime     " Auto read buffers when focus is gained
  au FocusLost * wall             " Auto save buffers when focus is lost
  au BufLeave * wall              " Write all changed buffers when leaving a buffer
augroup END

""" Plugin Settings

"" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1               " Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#formatter = 'unique_tail' " Use unique_tail as airline path formatter

"" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']    " Ensure that EditorConfig plugin works well with fugitive

"" NERDTree
let NERDTreeAutoDeleteBuffer = 1                           " Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeMinimalUI = 1                                  " Disable 'Press ? for help' text

"" vim-test
let test#strategy = "neovim"                               " Use neovim terminal as strategy to run tests
let test#neovim#term_position = "vsplit"                   " Run test in a vertical split pane

"" Sneak
let g:sneak#label = 1                                      " Enable label-mode for a minimalist alternative to EasyMotion

""" Keymaps

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

"" vim-test
nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>

"" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
