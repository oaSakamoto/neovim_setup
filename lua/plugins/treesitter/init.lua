return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'RRethy/nvim-treesitter-endwise' },
      'nvim-treesitter/playground',
    },
    build = ':TSUpdate',
    event = { 'bufReadPost', 'bufNewFile' },
    opts = {
      auto_install = true,
      endwise = {
        enable = true,
      },
      highlight = { enable = true },
      ensure_installed = {
        'bash',
        'dockerfile',
        'html',
        'markdown',
        'markdown_inline',
        'org',
        'query',
        'regex',
        'latex',
        'vim',
        'vimdoc',
        'yaml',
        'diff',
        'norg',
        'norg_meta',
        'lua',
        'python',
        'zig',
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },
}
