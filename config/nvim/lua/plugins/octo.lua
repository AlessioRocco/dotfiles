return {
  -- Octo.vim
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
      require("octo").setup({ enable_builtin = true })
    end,
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
    },
  },

  -- cmp-git
  -- https://github.com/petertriho/cmp-git/
  {
    "petertriho/cmp-git",
  },
}
