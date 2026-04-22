# Rofi configuration for Hyprland with Catppuccin Macchiato
{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.ghostty}/bin/ghostty";
    theme = ./rofi-theme.rasi;
  };
}
