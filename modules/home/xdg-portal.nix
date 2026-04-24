# XDG Desktop Portal configuration for Hyprland
{ ... }:
{
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=hyprland;gtk;
    org.freedesktop.impl.portal.ScreenCast=hyprland;
    org.freedesktop.impl.portal.Screenshot=hyprland;
  '';
}
