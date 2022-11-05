vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
