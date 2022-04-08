vim.cmd[[
let g:rails_projections = {
\   "app/components/*_component.rb": {
\     "alternate": "app/components/{}_component/{basename}_component.html.erb"
\   },
\   "app/components/*_component.html.erb": {
\     "alternate": "app/components/{dirname}/../{basename}_component.rb"
\   }
\ }
]]
