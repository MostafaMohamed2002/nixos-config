# Systemd user targets and services
{
  pkgs,
  lib,
  ...
}:
{
  systemd.user.targets."tray" = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  systemd.user.services.xdg-desktop-portal = {
    Unit = {
      Description = "XDG Desktop Portal";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.portal.Desktop";
      ExecStart = "${lib.getBin pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services.xdg-desktop-portal-hyprland = {
    Unit = {
      Description = "XDG Desktop Portal (Hyprland)";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.hyprland";
      ExecStart = "${lib.getBin pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
