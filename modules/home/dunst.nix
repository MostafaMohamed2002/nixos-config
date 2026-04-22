# Dunst notification daemon with Catppuccin Macchiato theme
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#8aadf4";
        frame_width = 2;
        corner_radius = 12;
        font = "JetBrainsMono Nerd Font 10";
        format = "<b>%s</b>\n%b";
        offset = "10x10";
        horizontal_padding = 10;
        icon_position = "left";
        max_icon_size = 48;
        shrink = "no";
      };

      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#f5a97f";
      };
    };
  };
}
