return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-rspec",
  },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = { ["neotest-rspec"] = {} },
  },
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
