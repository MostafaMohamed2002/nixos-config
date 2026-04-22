# Hyprland configuration with Catppuccin Macchiato
{pkgs, ...}: let
  monitorScript = pkgs.writeShellScriptBin "hypr-monitor-watch" ''
    handle() {
      case $1 in
        monitorremoved*)
          hyprctl keyword monitor "eDP-1,1920x1080@120,0x0,1.5"
          ;;
        monitoradded*)
          sleep 0.5
          hyprctl keyword monitor "eDP-1,disabled"
          hyprctl keyword monitor "HDMI-A-1,1920x1080@100,0x0,1"
          ;;
      esac
    }

    socat - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock \
      | while read -r line; do handle "$line"; done
  '';
in {
  home.packages = [pkgs.socat];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      # Monitor
      monitor = HDMI-A-1, 1920x1080@100, 0x0, 1
      monitor = eDP-1, disabled
      monitor = , preferred, auto, 1


      # Environment
      exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      # Autostart
      exec-once = hyprctl setcursor Bibata-Modern-Classic 24
      exec-once = dunst
      exec-once = swww init
      exec-once = udiskie --tray
      exec-once = ${monitorScript}/bin/hypr-monitor-watch


      # Catppuccin Macchiato colors
      $rosewater = rgba(f4dbd6ee)
      $flamingo = rgba(f0c6c6ee)
      $pink = rgba(f5bde6ee)
      $mauve = rgba(c6a0f6ee)
      $red = rgba(ed8796ee)
      $maroon = rgba(ee99a0ee)
      $peach = rgba(f5a97fee)
      $yellow = rgba(eed49fee)
      $green = rgba(a6da95ee)
      $teal = rgba(8bd5caee)
      $sky = rgba(91d7e3ee)
      $sapphire = rgba(7dc4e4ee)
      $blue = rgba(8aadf4ee)
      $lavender = rgba(b7bdf8ee)
      $text = rgba(cad3f5ee)
      $subtext1 = rgba(b8c0e0ee)
      $surface0 = rgba(363a4fee)
      $surface1 = rgba(494d64ee)
      $surface2 = rgba(5b6078ee)
      $base = rgba(24273aee)
      $mantle = rgba(1e2030ee)
      $crust = rgba(181926ee)

      input {
        kb_layout = us,ara
        kb_options = grp:win_space_toggle
        follow_mouse = 1
        touchpad {
          natural_scroll = false
        }
        sensitivity = 0
      }
      cursor {
        no_hardware_cursors = true
      }


      general {
        gaps_in = 1
        gaps_out = 1
        border_size = 1
        col.active_border = $mauve $blue 45deg
        col.inactive_border = $surface0
        layout = dwindle
      }


      decoration {
        rounding = 5
      }


      animations {
          enabled = true
          bezier = wind, 0.05, 0.85, 0.03, 0.97
          bezier = winIn, 0.07, 0.88, 0.04, 0.99
          bezier = winOut, 0.20, -0.15, 0, 1
          bezier = liner, 1, 1, 1, 1
          bezier = md3_standard, 0.12, 0, 0, 1
          bezier = md3_decel, 0.05, 0.80, 0.10, 0.97
          bezier = md3_accel, 0.20, 0, 0.80, 0.08
          bezier = overshot, 0.05, 0.85, 0.07, 1.04
          bezier = crazyshot, 0.1, 1.22, 0.68, 0.98
          bezier = hyprnostretch, 0.05, 0.82, 0.03, 0.94
          bezier = menu_decel, 0.05, 0.82, 0, 1
          bezier = menu_accel, 0.20, 0, 0.82, 0.10
          bezier = easeInOutCirc, 0.75, 0, 0.15, 1
          bezier = easeOutCirc, 0, 0.48, 0.38, 1
          bezier = easeOutExpo, 0.10, 0.94, 0.23, 0.98
          bezier = softAcDecel, 0.20, 0.20, 0.15, 1
          bezier = md2, 0.30, 0, 0.15, 1
          
          bezier = OutBack, 0.28, 1.40, 0.58, 1
          bezier = easeInOutCirc, 0.78, 0, 0.15, 1

          animation = border, 1, 1.6, liner
          animation = borderangle, 1, 82, liner, loop
          animation = windowsIn, 1, 3.2, winIn, slide
          animation = windowsOut, 1, 2.8, easeOutCirc
          animation = windowsMove, 1, 3.0, wind, slide
          animation = fade, 1, 1.8, md3_decel
          animation = layersIn, 1, 1.8, menu_decel, slide
          animation = layersOut, 1, 1.5, menu_accel
          animation = fadeLayersIn, 1, 1.6, menu_decel
          animation = fadeLayersOut, 1, 1.8, menu_accel
          animation = workspaces, 1, 4.0, menu_decel, slide
          animation = specialWorkspace, 1, 2.3, md3_decel, slidefadevert 15%
      }


      dwindle {
        pseudotile = yes
        preserve_split = yes
      }


      # Keybinds
      $mainMod = SUPER
      bind = $mainMod, RETURN, exec, ghostty
      bind = $mainMod, Q, killactive,
      bind = $mainMod, F, exec, nautilus
      bind = $mainMod, A, exec, rofi -show drun


      bind = $mainMod, P, exec, grim -g "$(slurp)" - | wl-copy

      bind = ,XF86AudioMicMute,exec,pamixer --default-source -t
      bind = ,XF86MonBrightnessDown,exec,light -U 20
      bind = ,XF86MonBrightnessUp,exec,light -A 20
      bind = ,XF86AudioMute,exec,pamixer -t
      bind = ,XF86AudioLowerVolume,exec,pamixer -d 10
      bind = ,XF86AudioRaiseVolume,exec,pamixer -i 10
      bind = ,XF86AudioPlay,exec,playerctl play-pause
      bind = ,XF86AudioPause,exec,playerctl play-pause


      bind = SUPER,Tab,cyclenext,
      bind = SUPER,Tab,bringactivetotop,


      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d


      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10


      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10


      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1


      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
