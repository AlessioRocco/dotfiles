return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      solargraph = {
        cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", "stdio" },
      },
      rubocop = {
        cmd = { os.getenv("HOME") .. "/.asdf/shims/rubocop", "--lsp" },
      },
    },
  },
}
