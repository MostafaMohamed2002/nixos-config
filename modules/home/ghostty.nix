# Ghostty configuration via Home Manager module
# Catppuccin Latte theme
{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      cursor-style-blink = false;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      # Catppuccin Latte colors
      background = "#eff1f5";
      foreground = "#4c4f69";
      cursor-color = "#dc8a78";
      cursor-text = "#eff1f5";
      selection-background = "#d8dae1";
      selection-foreground = "#4c4f69";
      split-divider-color = "#ccd0da";
      background-opacity = 1;
    };
  };
}
