return {
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        opts = function()
          local types = require('luasnip.util.types')
          return {
            history = true,
            delete_check_events = 'TextChanged',
            -- Display a cursor-like placeholder in unvisited nodes of the snippet.
            ext_opts = {
              [types.insertNode] = {
                unvisited = {
                  virt_text = { { '|', 'Conceal' } },
                  -- virt_text_pos = "inline",
                },
              },
              [types.exitNode] = {
                unvisited = {
                  virt_text = { { '|', 'Conceal' } },
                  -- virt_text_pos = "inline",
                },
              },
            },
          }
        end,
        build = (function()
          return 'make install_jsregexp'
        end)(),
        config = function(_, opts)
          require('luasnip').setup(opts)

          local snippets_folder = vim.fn.stdpath('config') .. '/lua/plugins/completion/snippets/'

          ---@diagnostic disable-next-line: assign-type-mismatch
          require('luasnip.loaders.from_lua').lazy_load({ paths = snippets_folder })

          vim.api.nvim_create_user_command('LuaSnipEdit', function()
            require('luasnip.loaders.from_lua').edit_snippet_files()
          end, {})
        end,
      },
    },

    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-a>'] = { 'select_and_accept' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<S-h>'] = { 'snippet_backward', 'fallback' },
        ['<C-y>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },
      snippets = { preset = 'luasnip' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
        },

        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'snippets', 'lsp', 'path' },
        per_filetype = {
          typescript = { 'snippets', 'lsp' },
        },
      },
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
-- return {
--   {
--     'hhhrsh7th/nvim-cmp',
--     event = 'InsertEnter',
--     dependencies = {
-- {
--   'L3MON4D3/LuaSnip',
--   opts = function()
--     local types = require('luasnip.util.types')
--     return {
--       history = true,
--       delete_check_events = 'TextChanged',
--       -- Display a cursor-like placeholder in unvisited nodes of the snippet.
--       ext_opts = {
--         [types.insertNode] = {
--           unvisited = {
--             virt_text = { { '|', 'Conceal' } },
--             -- virt_text_pos = "inline",
--           },
--         },
--         [types.exitNode] = {
--           unvisited = {
--             virt_text = { { '|', 'Conceal' } },
--             -- virt_text_pos = "inline",
--           },
--         },
--       },
--     }
--   end,
--   build = (function()
--     return 'make install_jsregexp'
--   end)(),
--   config = function(_, opts)
--     require('luasnip').setup(opts)
--
--     local snippets_folder = vim.fn.stdpath('config') .. '/lua/plugins/completion/snippets/'
--
--     ---@diagnostic disable-next-line: assign-type-mismatch
--     require('luasnip.loaders.from_lua').lazy_load({ paths = snippets_folder })
--
--     vim.api.nvim_create_user_command('LuaSnipEdit', function()
--       require('luasnip.loaders.from_lua').edit_snippet_files()
--     end, {})
--   end,
-- },
--       'hrsh7th/cmp-nvim-lsp',
--       'saadparwaiz1/cmp_luasnip',
--       'hrsh7th/cmp-path',
--     },
--     config = function()
--       local cmp = require('cmp')
--       local luasnip = require('luasnip')
--       luasnip.config.setup({})
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert({
--           ['<C-j>'] = cmp.mapping.select_next_item(),
--           ['<C-k>'] = cmp.mapping.select_prev_item(),
--
--           ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-m>'] = cmp.mapping.scroll_docs(4),
--
--           ['<C-a>'] = cmp.mapping.confirm({ select = true }),
--
--           ['<C-Space>'] = cmp.mapping.complete({}),
--
--           ['<C-l>'] = cmp.mapping(function()
--             if luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             end
--           end, { 'i', 's' }),
--           ['<C-h>'] = cmp.mapping(function()
--             if luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             end
--           end, { 'i', 's' }),
--         }),
--         sources = {
--           {
--             name = 'lazydev',
--             -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
--             group_index = 0,
--           },
--           { name = 'nvim_lsp' },
--           { name = 'luasnip' },
--           { name = 'path' },
--         },
--       })
--     end,
--   },
-- }
