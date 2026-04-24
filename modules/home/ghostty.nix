# Ghostty configuration via Home Manager module
# Catppuccin Latte theme
{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      cursor-style-blink = false;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      # Catppuccin Latte colors
      background = "#eff1f5";
      foreground = "#000000";
      cursor-color = "#dc8a78";
      cursor-text = "#000000";
      selection-background = "#d8dae1";
      selection-foreground = "#000000";
      split-divider-color = "#ccd0da";
      background-opacity = 1;
    };
  };
}
