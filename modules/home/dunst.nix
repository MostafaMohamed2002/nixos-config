# Dunst notification daemon with Catppuccin Macchiato theme
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        rounded = "yes";
        origin = "top-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "350";
        height = "100";
        gap_size = 8;
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
        corner_radius = 12;
        follow = "mouse";
        font = "JetBrainsMono Nerd Font 10";
        format = "<b>%s</b>\n%b";
        frame_color = "#8aadf4";
        frame_width = 2;
        offset = "12x12";
        horizontal_padding = 12;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 48;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 12;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "no";
        word_wrap = "yes";
      };

      fullscreen_delay_everything = {
        fullscreen = "delay";
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
