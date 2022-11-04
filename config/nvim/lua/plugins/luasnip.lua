local luasnip = require('luasnip')

luasnip.filetype_extend("ruby", {"rails"})

require("luasnip.loaders.from_vscode").lazy_load()
