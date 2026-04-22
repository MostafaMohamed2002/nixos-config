# Nautilus (GNOME Files) configuration
{...}: {
  programs.nautilus = {
    enable = true;
    showHiddenFiles = true;
    showMountDetails = true;
    enableBookmarks = true;
  };

  home.sessionVariables = {
    NAUTILUS_USE_I3 = "true";
    GIO_USE_VIRTUAL_FILE_MONITOR = "0";
    GTK_USE_PORTAL = "1";
  };
  services.gvfs.enable = true;
}
