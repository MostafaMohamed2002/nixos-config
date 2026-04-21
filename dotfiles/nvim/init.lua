-- Neovim configuration for mostafa
-- Synced from ~/.config/nvim/init.lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.cursorline = true

-- Color scheme
vim.cmd.colorscheme("desert")

-- Basic key mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
