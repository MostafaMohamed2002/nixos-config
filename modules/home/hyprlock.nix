{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      background = [
        {
          path = "${../../wallpapers/wallpaper_1.png}";
          color = "rgba(104, 156, 159, 255)"; # Teal sky fallback
          blur_passes = 2;
          vibrancy_darkness = 0.0;
        }
      ];

      shape = [
        # User box
        {
          size = "300, 50";
          rounding = 20;
          border_size = 2;
          color = "rgba(250, 220, 160, 0.40)"; # Warm sand, semi-transparent
          border_color = "rgba(124, 53, 33, 0.95)"; # Terracotta

          position = "0, 270";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Time
        {
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
          font_size = 115;
          font_family = "Maple Mono Bold";
          shadow_passes = 3;
          color = "rgba(255, 250, 250, 1)"; # Black for readability

          position = "0, -150";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';
          font_size = 18;
          font_family = "Maple Mono";
          shadow_passes = 3;
          color = "rgba(255, 255, 255, 0.9)";

          position = "0, -350";
          halign = "center";
          valign = "top";
        }
        # Username
        {
          text = "  $USER";
          font_size = 15;
          font_family = "Maple Mono Bold";
          color = "rgba(255, 255, 255, 1)";

          position = "0, 284";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          size = "300, 50";
          rounding = 20;
          outline_thickness = 2;
          dots_spacing = 0.4;

          font_color = "rgba(255, 255, 255, 1)";
          font_family = "JetBrainsMono Nerd Font";

          outer_color = "rgba(124, 53, 33, 0.95)"; # Terracotta border
          inner_color = "rgba(250, 220, 160, 0.50)"; # Warm sand fill
          check_color = "rgba(79, 102, 50, 0.95)"; # Olive green (success)
          fail_color = "rgba(180, 40, 40, 0.95)"; # Deep red (fail)
          capslock_color = "rgba(196, 118, 43, 0.95)"; # Warm orange (caps)
          bothlock_color = "rgba(196, 118, 43, 0.95)";

          hide_input = false;
          fade_on_empty = false;

          position = "0, 200";
          halign = "center";
          valign = "bottom";
        }
      ];

      animation = ["inputFieldColors, 0"];
    };
  };
}
