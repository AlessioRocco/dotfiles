return {
  "nvim-mini/mini.files",
  keys = {
    {
      "-",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "_",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
  opts = {
    windows = {
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
}
