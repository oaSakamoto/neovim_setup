---@type LazySpec
return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('oil').setup({
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
    })
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Abrir diretorio pai' })
    vim.keymap.set('n', '<space>-', require('oil').toggle_float)
  end,
}
