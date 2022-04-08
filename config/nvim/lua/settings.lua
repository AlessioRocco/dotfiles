-- General
vim.opt.clipboard     = vim.opt.clipboard + "unnamed" -- Copy and Paste from the system clipboard
vim.opt.list          = true                          -- Display extra whitespace
vim.opt.listchars     = {
  nbsp                = '⦸',                          -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends             = '»',                          -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes            = '«',                          -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab                 = '▷⋯',                         -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  trail               = '•',                          -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.mouse         = 'a'                           -- Enable mouse
vim.opt.wildmode      = 'longest:full,full'           -- Shell-like autocomplete to unambiguous portion
vim.opt.number        = true                          -- Use absolute line numbers column
-- Split window
vim.opt.splitbelow    = true                          -- Open new split panes to bottom, which feels more natural
vim.opt.splitright    = true                          -- Open new split panes to right, which feels more natural
-- Wrap line
vim.opt.wrap          = false                         -- Lines will not wrap and only part of long lines will be displayed
vim.opt.scrolloff     = 2                             -- Set minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10                            -- Set minimal number of screen columns to keep to the left and to the right of the cursor
-- Searching
vim.opt.ignorecase    = true                          -- Searching is not case sensitive
vim.opt.smartcase     = true                          -- Make search case sensitive only if it contains uppercase letters
-- Autoread and autowrite
vim.opt.autowrite     = true                          -- Write the contents of the file if it has been modified
vim.opt.autowriteall  = true                          -- Like 'autowrite' but also used for commands
vim.opt.swapfile      = false                         -- Don't create a swapfile for a new buffer
vim.opt.writebackup   = false                         -- Don't backup before overwriting a file
vim.opt.undofile      = true                          -- Automatically save your undo history
-- Theme preferences
vim.opt.termguicolors = true                          -- Set up true color support
vim.cmd[[colorscheme dracula]]                        -- Set Dracula as default theme

-- Automatically save changes to disk without having to use :w
vim.cmd([[
  augroup update_buffers
    au!
    au FocusGained * :checktime     " Auto read buffers when focus is gained
    au FocusLost * wall             " Auto save buffers when focus is lost
    au BufLeave * wall              " Write all changed buffers when leaving a buffer
  augroup END
]])
