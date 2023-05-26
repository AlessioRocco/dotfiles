return {
  -- oil.nvim
  -- https://github.com/stevearc/oil.nvim
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      {
        "-",
        function()
          require("oil").open_float()
        end,
        desc = "Open parent directory",
      },
    },
  },
}
