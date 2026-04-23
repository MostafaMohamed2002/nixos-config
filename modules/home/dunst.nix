{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        rounded = "yes";
        origin = "top-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "400";
        height = "400";
        scale = 0;
        gap_size = 0;
        progress_bar = true;
        transparency = 0;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 10;
        follow = "mouse";
        font = "JetBrainsMono Nerd Font 10";
        format = "<b>%s</b>\\n%b";
        frame_color = "#1e66f5";
        frame_width = 1;
        offset = "15x15";
        horizontal_padding = 10;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 10;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "no";
        word_wrap = "yes";
        browser = "firefox";
      };

      fullscreen_delay_everything = {
        fullscreen = "delay";
      };

      urgency_critical = {
        background = "#eff1f5";
        foreground = "#4c4f69";
        frame_color = "#fe640b";
      };
      urgency_low = {
        background = "#eff1f5";
        foreground = "#4c4f69";
      };
      urgency_normal = {
        background = "#eff1f5";
        foreground = "#4c4f69";
      };
    };
  };
}
