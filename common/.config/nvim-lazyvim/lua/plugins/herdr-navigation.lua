return {
  "paulbkim-dev/vim-herdr-navigation",
  lazy = false,
  dependencies = { "christoomey/vim-tmux-navigator" },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
