require('luasnip.session.snippet_collection').clear_snippets('norg')

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('norg', {
  s(
    'ref',
    fmt(
      [[
        * Referências
         - {{{}}}[{}] 
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    'meta',
    fmt(
      [[
    @document.meta
    title: {},
    description: {}
    author: {}
    categories: {}
    created: {}
    version: {}
    @end
    ]],
      { i(1), i(2), i(3), i(4), i(5), i(6, '0.1') }
    )
  ),

  s('mbold', fmt([[*{}*]], { i(1) })),
  s('mitalic', fmt([[/{}/]], { i(1) })),
  s('munderline', fmt([[^{}^]], { i(1) })),
  s('mstrikethrough', fmt([[-{}-]], { i(1) })),
  s('minlinecode', fmt([[`{}`]], { i(1) })),
  s('msuperscript', fmt([[^{}^]], { i(1) })),
  s('msubscript', fmt([[,{},]], { i(1) })),
  s(
    'clua',
    fmt(
      [[
    @code lua
    {}
    @end
    ]],
      { i(1) }
    )
  ),

  s(
    'cpy',
    fmt(
      [[
    @code python
    {}
    @end
    ]],
      { i(1) }
    )
  ),

  s(
    'cty',
    fmt(
      [[
    @code typescript
    {}
    @end
    ]],
      { i(1) }
    )
  ),
  s(
    'cjs',
    fmt(
      [[
    @code javascript
    {}
    @end
    ]],
      { i(1) }
    )
  ),
})
