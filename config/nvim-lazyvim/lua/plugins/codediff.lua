return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {},
  keys = {
    {
      "<leader>gr",
      function()
        local base = vim.fn.system("git rev-parse --abbrev-ref origin/HEAD 2>/dev/null")
        base = base:gsub("\n", ""):gsub("^origin/", "")
        if base == "" or base:match("^fatal") then
          base = "main"
        end
        vim.cmd("CodeDiff history origin/" .. base .. "..HEAD")
      end,
      desc = "Git Review History (CodeDiff)",
    },
  },
  config = function(_, opts)
    require("codediff").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "codediff-history",
      callback = function(args)
        vim.keymap.set("n", "K", function()
          local line = vim.api.nvim_get_current_line()
          local sha = line:match("| (%x%x%x%x%x%x%x%x)")
          if not sha then
            return
          end

          local msg = vim.fn.system("git log --format='%B' -n 1 " .. sha):gsub("\n+$", "")
          Snacks.win({
            text = vim.split(msg, "\n"),
            ft = "gitcommit",
            width = 0.6,
            height = 0.4,
            border = "rounded",
            title = " Commit " .. sha .. " ",
            enter = true,
            keys = { ["<Esc>"] = "close" },
          })
        end, { buffer = args.buf, desc = "Show full commit message" })
      end,
    })
  end,
}
