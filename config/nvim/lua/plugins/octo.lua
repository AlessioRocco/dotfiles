return {
  -- Add octo.vim
  -- https://github.com/pwntester/octo.nvim
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    config = function()
      require("octo").setup()
    end,
    keys = {
      { "<leader>hpl", "<cmd>Octo pr list<cr>", desc = "List" },
      { "<leader>hpm", "<cmd>Octo pr search is:open author:@me <cr>", desc = "Created by me" },
      {
        "<leader>hpr",
        "<cmd>Octo pr search is:open review-requested:@me<cr>",
        desc = "Awaiting review from you or your team",
      },
    },
  },
}
