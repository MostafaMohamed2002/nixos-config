# i3 configuration with Catppuccin Latte
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    nitrogen
    scrot
    playerctl
    light
    pamixer
    xss-lock
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    config = {
      modifier = "Mod4";

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        size = 10.0;
      };

      window = {
        border = 1;
        titlebar = false;
      };

      gaps = {
        inner = 5;
        outer = 5;
      };

      startup = [
        {
          command = "xsetroot -cursor_name left_ptr";
          always = true;
          notification = false;
        }
        {
          # Hardcoded path to wallpaper in config repo
          # TODO: Use xdg substitution or copy to ~/.config for portability
          command = "nitrogen --set-zoom-fill --save /home/mostafa/nixos-config/wallpapers/wallpaper_1.png";
          always = true;
          notification = false;
        }
        {
          command = "xss-lock -- lock";
          always = true;
          notification = false;
        }
      ];

      keybindings = lib.mkOptionDefault {
        "Mod4+Return" = "exec kitty";
        "Mod4+q" = "kill";
        "Mod4+f" = "exec nautilus";
        "Mod4+a" = "exec rofi -show drun";
        "Mod4+l" = "exec i3lock";
        "Mod4+p" = "exec scrot -s -e 'xclip -selection clipboard -t image/png $f'";

        "Mod4+Left" = "focus left";
        "Mod4+Right" = "focus right";
        "Mod4+Up" = "focus up";
        "Mod4+Down" = "focus down";

        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Right" = "move right";
        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Down" = "move down";

        "Mod4+1" = "workspace 1";
        "Mod4+2" = "workspace 2";
        "Mod4+3" = "workspace 3";
        "Mod4+4" = "workspace 4";
        "Mod4+5" = "workspace 5";
        "Mod4+6" = "workspace 6";
        "Mod4+7" = "workspace 7";
        "Mod4+8" = "workspace 8";
        "Mod4+9" = "workspace 9";
        "Mod4+0" = "workspace 10";

        "Mod4+Shift+1" = "move container to workspace 1";
        "Mod4+Shift+2" = "move container to workspace 2";
        "Mod4+Shift+3" = "move container to workspace 3";
        "Mod4+Shift+4" = "move container to workspace 4";
        "Mod4+Shift+5" = "move container to workspace 5";
        "Mod4+Shift+6" = "move container to workspace 6";
        "Mod4+Shift+7" = "move container to workspace 7";
        "Mod4+Shift+8" = "move container to workspace 8";
        "Mod4+Shift+9" = "move container to workspace 9";
        "Mod4+Shift+0" = "move container to workspace 10";

        "Mod4+h" = "split h";
        "Mod4+v" = "split v";
        "Mod4+Shift+f" = "fullscreen toggle";
        "Mod4+t" = "layout toggle splith tabbed";
        "Mod4+Shift+s" = "sticky toggle";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+r" = "mode resize";

        "Mod4+Shift+e" = "exec ${pkgs.playerctl}/bin/playerctl stop";

        # Media keys
        "XF86AudioMicMute" = "exec pamixer --default-source -t";
        "XF86MonBrightnessDown" = "exec light -U 20";
        "XF86MonBrightnessUp" = "exec light -A 20";
        "XF86AudioMute" = "exec pamixer -t";
        "XF86AudioLowerVolume" = "exec pamixer -d 10";
        "XF86AudioRaiseVolume" = "exec pamixer -i 10";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioPause" = "exec playerctl play-pause";
      };

      bars = [
        {
          position = "bottom";
          statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
        }
      ];
    };
  };
}
