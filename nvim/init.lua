local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smarttab = true
set.number = true

require('plugins')
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Just the defaults.
require('nvim-tree').setup()

