return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'RRethy/nvim-treesitter-endwise' },
      'nvim-treesitter/playground',
      { 'nushell/tree-sitter-nu', build = ':TSUpdate nu' },
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
        'css',
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
        'c',
        'lua',
        'python',
        'zig',
        'javascript',
        'nu',
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
