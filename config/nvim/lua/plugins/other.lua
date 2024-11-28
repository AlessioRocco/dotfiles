return {
  "rgroli/other.nvim",
  main = "other-nvim",
  opts = {
    mappings = {
      "rails",
      {
        pattern = "app/components/(.*)/(.*)_component.rb",
        target = "app/components/%1/%2_component/%2_component.html.erb",
        context = "component",
      },
      {
        pattern = "app/components/(.*)/.*_component/(.*)_component.html.erb",
        target = "app/components/%1/%2_component.rb",
        context = "component",
      },
      {
        pattern = "app/extensions/(.*)/(.*)_extension.rb",
        target = "spec/%1/%2_spec.rb",
        context = "test",
      },
      {
        pattern = "spec/(.*)/(.*)_spec.rb",
        target = "app/extensions/%1/%2_extension.rb",
      },
    },
    rememberBuffers = false,
  },
  keys = {
    {
      "<leader>oo",
      "<cmd>:Other<CR>",
      desc = "Other",
    },
    {
      "<leader>os",
      "<cmd>:OtherSplit<CR>",
      desc = "Other horizontal split",
    },
    {
      "<leader>ov",
      "<cmd>:OtherVSplit<CR>",
      desc = "Other vertical split",
    },
  },
}
