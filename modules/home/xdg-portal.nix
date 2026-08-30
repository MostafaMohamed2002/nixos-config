# XDG Desktop Portal configuration for i3/X11
{...}: {
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=gtk;
  '';
}
