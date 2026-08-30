# Rofi configuration for Hyprland with Catppuccin Macchiato
{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./rofi-theme.rasi;
  };
}
