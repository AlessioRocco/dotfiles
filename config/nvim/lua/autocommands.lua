-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight',
  { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Automatically save changes to disk without having to use :w
vim.cmd([[
  augroup update_buffers
    au!
    au FocusGained * :checktime     " Auto read buffers when focus is gained
    au FocusLost * wall             " Auto save buffers when focus is lost
    au BufLeave * wall              " Write all changed buffers when leaving a buffer
  augroup END
]])
