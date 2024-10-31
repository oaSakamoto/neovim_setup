local workspace = '~/.grimorio'
return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup({
        load = {
          ['core.defaults'] = {},
          ['core.looking-glass'] = {},
          ['core.presenter'] = {
            config = {
              zen_mode = 'zen-mode',
            },
          },
          ['core.keybinds'] = {
            config = {
              default_keybinds = false,
            },
          },
          ['core.concealer'] = {
            config = {
              folds = false,
              icons = {
                code_block = {
                  conceal = true,
                },
              },
            },
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.dirman'] = {
            config = {
              default_workspaces = 'grimorio',
              index = 'index.norg',
              workspaces = {
                grimorio = workspace,
                projetos = workspace .. '00-projetos',
                assuntos = workspace .. '01-assuntos',
                recursos = workspace .. '02-recursos',
              },
            },
          },
        },
      })
      vim.wo.conceallevel = 2
    end,
  },
}
