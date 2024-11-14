-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- relative numbers
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.clipboard = 'unnamedplus' -- use system clipboard for yank

-- tab sizes
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.colorcolumn = "100"
