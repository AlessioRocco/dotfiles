lua <<EOF
require('keybindings')
require('plugins')
require('settings')
EOF

augroup update_buffers
  au!
  au FocusGained * :checktime     " Auto read buffers when focus is gained
  au FocusLost * wall             " Auto save buffers when focus is lost
  au BufLeave * wall              " Write all changed buffers when leaving a buffer
augroup END

""" Plugin Settings

augroup TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
