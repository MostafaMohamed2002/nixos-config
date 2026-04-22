# Waybar configuration with Catppuccin Macchiato
{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 8;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [];
        modules-right = [
          "cpu"
          "memory"
          "network"
          "battery"
          "pulseaudio"
          "hyprland/language"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          sort-by-number = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "US";
          format-ara = "ARA";
        };

        clock = {
          format = "{:%a %d %b  %I:%M %p}";
          tooltip = true;
          tooltip-format = "{:%Y-%m-%d %H:%M:%S}";
        };

        pulseaudio = {
          format = "Vol {volume}%";
          format-muted = "Vol muted";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "WIFI {signalStrength}%";
          format-ethernet = "ETH";
          format-disconnected = "No Net";
          tooltip-format = "{ifname}: {ipaddr}";
          on-click = "ghostty -e nmtui";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "Bat {capacity}%";
          format-charging = "Bat {capacity}%";
          format-plugged = "AC {capacity}%";
        };

        cpu = {
          format = "CPU {usage}%";
          tooltip = false;
        };

        memory = {
          format = "RAM {used:0.1f}GB";
          tooltip = false;
        };

        tray = {
          spacing = 8;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        border-radius: 10px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(36, 39, 58, 0.90);
        color: #cad3f5;
      }

      #workspaces {
        background: #1e2030;
        padding: 4px 8px;
        margin: 6px 6px;
        border-radius: 12px;
      }

      #workspaces button {
        color: #b8c0e0;
        padding: 2px 8px;
        margin: 0 4px;
      }

      #workspaces button.active {
        background: #c6a0f6;
        color: #181926;
      }

      #workspaces button.urgent {
        background: #ed8796;
        color: #181926;
      }

      #window {
        background: #1e2030;
        padding: 4px 8px;
        margin: 6px 6px;
        border-radius: 12px;
      }

      #clock,
      #pulseaudio,
      #network,
      #battery,
      #cpu,
      #memory,
      #tray,
      #language {
        background: #1e2030;
        padding: 4px 10px;
        margin: 6px 4px;
      }

      #pulseaudio.muted {
        color: #f5a97f;
      }

      #network.disconnected {
        color: #ed8796;
      }

      #battery.warning {
        color: #f5a97f;
      }

      #battery.critical {
        color: #ed8796;
      }
    '';
  };
}
