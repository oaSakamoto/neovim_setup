return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 80,
    },
  },
  config = function(_, opts)
    require('zen-mode').setup(opts)
    vim.keymap.set('n', '<leader>z', require('zen-mode').toggle, { noremap = true, silent = true })
  end,
}
