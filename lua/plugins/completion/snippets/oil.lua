require('luasnip.session.snippet_collection').clear_snippets('oil')

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('oil', {
  s(
    'fnorg',
    fmt(
      [[
        {}.norg 
      ]],
      { i(1) }
    )
  ),
})
