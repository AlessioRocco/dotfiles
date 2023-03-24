return {
  -- EditorConfig Vim Plugin
  -- https://github.com/editorconfig/editorconfig-vim
  {
    "editorconfig/editorconfig-vim",
    lazy = false,
    config = function()
      -- Ensure that EditorConfig plugin works well with Fugitive
      vim.g.EditorConfig_exclude_patterns = {
        "fugitive://.*",
        "*COMMIT_EDITMSG",
      }
    end,
  },
}
