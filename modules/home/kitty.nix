# Kitty configuration via Home Manager module
# Catppuccin Latte theme
{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 13;
      cursor_blink = "no";
      cursor_shape = "beam";
      scrollback_lines = 10000;
    };

    extraConfig = ''
      # Catppuccin Latte colors
      background #eff1f5
      foreground #000000
      cursor #dc8a78
      selection_background #d8dae1
      selection_foreground #000000
    '';

    keybindings = {
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+d" = "close_window";
    };
  };
}
