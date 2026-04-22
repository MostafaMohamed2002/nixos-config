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
  };
  services.gvfs.enable = true;
}
