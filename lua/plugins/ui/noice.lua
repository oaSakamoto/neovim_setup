return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies =  {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup({
          background_colour = '#00000000',
          -- stages = 'static',
          render = 'compact',
          timeout = 3000,
          fps = 60
        })
      end
    },
  },
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
}
