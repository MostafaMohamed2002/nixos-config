# Neovim configuration
{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.smartindent = true
      vim.opt.cursorline = true

      vim.cmd.colorscheme("desert")

      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
      vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
    '';
  };
}
