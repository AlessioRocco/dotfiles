return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex = {
        settings = {
          ltex = {
            enabled = {
              "bibtex",
              "context",
              "context.tex",
              "gitcommit",
              "html",
              "latex",
              "markdown",
              "org",
              "restructuredtext",
              "rsweave",
            },
          },
        },
      },
    },
  },
}
