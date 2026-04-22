# Hyprland configuration with Catppuccin Macchiato
{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      # Monitor
      monitor=,preferred,auto,1

      # Environment
      exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      # Autostart
      exec-once = hyprctl setcursor Bibata-Modern-Classic 24
      exec-once = dunst

      exec-once = swww init

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

      general {
        gaps_in = 2
        gaps_out = 5
        border_size = 2
        col.active_border = $mauve $blue 45deg
        col.inactive_border = $surface0
        layout = dwindle
      }

      decoration {
        rounding = 10
      }

      animations {
        enabled = yes
        bezier = ease,0.4,0.02,0.21,1
        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
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

      bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
      bind = SHIFT, Print, exec, grim -g "$(slurp)"

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
