return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>gp",
      "",
      desc = "GitHub Pull Requests",
    },
    {
      "<leader>gpr",
      function()
        Snacks.picker.gh_pr({ search = "review-requested:@me draft:false", state = "open" })
      end,
      desc = "GitHub Pull Requests (review requested)",
    },
    {
      "<leader>gpm",
      function()
        Snacks.picker.gh_pr({ search = "author:@me", state = "open" })
      end,
      desc = "GitHub Pull Requests (mine)",
    },
    {
      "<leader>gpi",
      function()
        Snacks.picker.gh_pr({ search = "involves:@me draft:false", state = "open" })
      end,
      desc = "GitHub Pull Requests (involves me)",
    },
  },
}
