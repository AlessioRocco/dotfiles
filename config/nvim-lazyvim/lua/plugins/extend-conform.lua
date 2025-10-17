return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format", "erb_lint" },
    },
    formatters = {
      erb_lint = {
        command = "erb_lint",
        args = { "-a", "$FILENAME" },
        stdin = false, -- erb_lint does not support stdin
      },
    },
  },
}
