# Neovim configuration with Catppuccin Machiato
{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      neo-tree-nvim
      nvim-web-devicons
    ];
  };

  xdg.configFile."nvim" = {
    source = ../config/nvim;
    recursive = true;
  };
}
