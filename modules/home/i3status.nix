# i3status-rust configuration - matching waybar modules
{pkgs, ...}: let
  powerMenu = pkgs.writeShellScriptBin "power-menu" ''
    choice=$(printf "%s\n" lock logout reboot shutdown | rofi -dmenu -i -p "Power")

    case "$choice" in
      lock)
        i3lock
        ;;
      logout)
        i3-msg exit
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
in {
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      blocks = [
        {
          block = "cpu";
          interval = 1;
          format = " CPU: $utilization ";
        }
        {
          block = "temperature";
          interval = 5;
          format = " Temp: $max ";
        }
        {
          block = "memory";
          format = " RAM: $mem_used.eng(prefix:Mi) ";
        }
        {
          block = "net";
          format = " WIFI: $ssid ";
        }
        {
          block = "battery";
          format = " Bat: $percentage ";
          full_format = " AC: $percentage ";
        }
        {
          block = "sound";
          format = " Vol: $volume ";
        }
        {
          block = "custom";
          command = "echo ⏻";
          interval = 99999;
          click = [
            {
              button = "left";
              cmd = "${powerMenu}/bin/power-menu";
            }
          ];
        }
        {
          block = "time";
          interval = 60;
          format = "$timestamp.datetime(f:'%a %d %b %I:%M %p')";
        }
      ];
      settings = {
        theme = {
          theme = "plain";
          overrides = {
            idle_fg = "#ffffff";
          };
        };
      };
      icons = "none";
    };
  };
}
