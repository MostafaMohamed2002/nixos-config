# Ghostty configuration via Home Manager module
# Catppuccin Machiato theme
{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      cursor-style-blink = false;
      font-family = "Maple Mono NF";
      font-size = 13;

      # Catppuccin Machiato colors
      background = "#24273a";
      foreground = "#cad3f5";
      cursor-color = "#f4dbd6";
      cursor-text = "#181926";
      selection-background = "#3a3e53";
      selection-foreground = "#cad3f5";
      split-divider-color = "#363a4f";
      background-opacity = 0.950000;
    };
  };
}
