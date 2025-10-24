return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "franco-ruggeri/codecompanion-lualine.nvim",
  },
  opts = {
    sections = {
      lualine_x = {
        "codecompanion",
      },
    },
  },
}
