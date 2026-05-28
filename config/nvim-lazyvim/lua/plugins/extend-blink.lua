return {
  "saghen/blink.cmp",
  specs = {
    "Kaiser-Yang/blink-cmp-git",
  },
  opts = {
    sources = {
      default = { "git" },
      providers = {
        git = {
          module = "blink-cmp-git",
          name = "Git",
          -- only enable this source when filetype is gitcommit or markdown
          enabled = function()
            return vim.tbl_contains({ "gitcommit", "markdown" }, vim.bo.filetype)
          end,
        },
      },
    },
  },
}
