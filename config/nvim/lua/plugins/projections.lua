return {
  -- projectionist.vim: Granular project configuration
  -- https://github.com/tpope/vim-projectionist
  {
    "tpope/vim-projectionist",
    ft = { "ruby", "eruby" },
    dependencies = { "tpope/vim-rails" },
    config = function()
      vim.cmd([[
      let g:rails_projections = {
      \   "app/components/*_component.rb": {
      \     "alternate": "app/components/{}_component/{basename}_component.html.erb"
      \   },
      \   "app/components/*_component.html.erb": {
      \     "alternate": "app/components/{dirname}/../{basename}_component.rb"
      \   },
      \   "app/extensions/*_extension.rb": {
      \     "alternate": "spec/{dirname}/{basename}_spec.rb"
      \   },
      \   "spec/*_spec.rb": {
      \     "alternate": "app/extensions/{dirname}/{basename}_extension.rb"
      \   },
      \ }
      ]])
    end,
  },
}
