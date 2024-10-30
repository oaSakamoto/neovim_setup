return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      {
        'ThePrimeagen/harpoon',
        lazy = false,
        branch = 'harpoon2',
      },
    },
    cmd = 'Telescope',
    opts = {
      defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      pickers = {
        find_files = {
          initial_mode = 'insert',
        },
      },
      extensions = {
        file_browser = {
          initial_mode = 'normal',
          hijack_netrw = true,
          hidden = true,
          grouped = true,
          display_stat = false,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local map = vim.keymap.set

      telescope.setup(opts)
      pcall(telescope.load_extension('file_browser'))
      pcall(telescope.load_extension('ui-select'))
      --  builtin
      map('n', '<leader>ts', builtin.find_files, { desc = 'Procurar arquivos' })
      map('n', '<leader>th', builtin.help_tags, { desc = 'Procurar help tags' })

      -- file browser
      map('n', '<leader>tb', function()
        require('telescope').extensions.file_browser.file_browser()
      end, { desc = 'Navegue no diretorio raiz' })

      map('n', '<leader>tc', function()
        require('telescope').extensions.file_browser.file_browser({
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
          select_buffer = true,
        })
      end, { desc = 'Navegue no diretorio atual' })

      local map = vim.keymap.set
      local harpoon = require('harpoon')
      local harpoon_picker = require('plugins.telescope.harpoon_picker').picker

      -- Função auxiliar para criar mapeamentos
      local function harpoon_map(lhs, rhs, desc)
        map('n', '<leader>' .. lhs, rhs, { desc = desc })
      end

      -- Mapeamentos principais
      harpoon_map('<leader>', function()
        harpoon_picker(harpoon:list())
      end, 'Abrir harpoon')
      harpoon_map('ha', function()
        harpoon:list():add()
      end, 'Adiciona buffer')
      harpoon_map('hc', function()
        harpoon:list():clear()
      end, 'Limpar lista')
      harpoon_map('hh', function()
        harpoon:list():prev()
      end, 'Buffer anterior')
      harpoon_map('hl', function()
        harpoon:list():next()
      end, 'Proximo Buffer')

      -- Mapeamentos para seleção de buffers
      local buffer_keys = { '(', '{', '[', '=' }
      local buffer_names = { 'Primeiro', 'Segundo', 'Terceiro', 'Quarto' }
      for i, key in ipairs(buffer_keys) do
        harpoon_map(key, function()
          harpoon:list():select(i)
        end, buffer_names[i] .. ' buffer')
      end

      -- Mapeamentos para substituição de buffers
      for i, key in ipairs(buffer_keys) do
        harpoon_map('hr' .. key, function()
          harpoon:list():replace_at(i)
        end, 'Substitui o ' .. buffer_names[i]:lower() .. ' buffer')
      end
    end,
  },
}
