return {
  "nvim-neotest/neotest",
  keys = {
    {
      "<leader>ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach Nearest",
    },
  },
}
