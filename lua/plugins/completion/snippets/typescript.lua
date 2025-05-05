require('luasnip.session.snippet_collection').clear_snippets('typescript')

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('typescript', {
  s(
    'desc',
    fmt(
      [[
        describe("{}", () => {{  
          it("should {}", () => {{
            {}
          }})
        }});
      ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    'it',
    fmt(
      [[
        it("should {}", () => {{
          {}
        }});
      ]],
      { i(1), i(2) }
    )
  ),
})
