local g = vim.g
local set = vim.keymap.set
local o = vim.opt

g.have_nerd_font = true
g.mapleader = ' '
g.localleader = ' '
set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

o.number = true
o.relativenumber = true

o.signcolumn = 'yes'
o.showmode = false

o.splitbelow = true
o.splitright = true

o.wrap = false
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.breakindent = true

o.scrolloff = 999
o.cursorline = true

o.mouse=''

o.undofile = true

o.ignorecase = true
o.smartcase = true

o.updatetime = 250
o.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


