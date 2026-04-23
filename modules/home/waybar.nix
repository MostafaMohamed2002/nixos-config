# Waybar configuration with Catppuccin Latte
{ pkgs, ... }:
let
  powerMenu = pkgs.writeShellScriptBin "power-menu" ''
    choice=$(printf "%s\n" lock logout reboot shutdown | rofi -dmenu -i -p "Power")

    case "$choice" in
      lock)
        hyprlock
        ;;
      logout)
        hyprctl dispatch exit
        ;;
      reboot)
        systemctl reboot
        ;;
      shutdown)
        systemctl poweroff
        ;;
      *)
        exit 0
        ;;
    esac
  '';
in
{
  systemd.user.services.waybar = {
    Service = {
      Restart = "on-failure";
      RestartSec = 2;
    };
    Unit = {
      StartLimitIntervalSec = 0;
    };
  };

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
          "custom/launcher"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ ];
        modules-right = [
          "cpu"
          "memory"
          "network"
          "battery"
          "pulseaudio"
          "hyprland/language"
          "clock"
          "tray"
          "custom/power"
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

        "custom/launcher" = {
          format = "";
          tooltip = false;
          on-click = "rofi -show drun";
          align = 0.5;
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "${powerMenu}/bin/power-menu";
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
        background: rgba(230, 233, 239, 0.90);
        color: #4c4f69;
      }

      #custom-launcher,
      #custom-power {
        background: #e6e9ef;
        padding: 4px 10px;
        margin: 6px 4px;
        border-radius: 12px;
        min-width: 24px;
      }

      #workspaces {
        background: #e6e9ef;
        padding: 4px 8px;
        margin: 6px 6px;
        border-radius: 12px;
      }

      #workspaces button {
        color: #5c5f77;
        padding: 2px 8px;
        margin: 0 4px;
      }

      #workspaces button.active {
        background: #8839ef;
        color: #eff1f5;
      }

      #workspaces button.urgent {
        background: #d20f39;
        color: #eff1f5;
      }

      #window {
        background: #e6e9ef;
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
      #language,
      #custom-power {
        background: #e6e9ef;
        padding: 4px 10px;
        margin: 6px 4px;
      }

      #pulseaudio.muted {
        color: #fe640b;
      }

      #network.disconnected {
        color: #d20f39;
      }

      #battery.warning {
        color: #fe640b;
      }

      #battery.critical {
        color: #d20f39;
      }
    '';
  };
}
