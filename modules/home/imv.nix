{pkgs, ...}: {
  programs.imv = {
    enable = true;
    settings = {
      options = {
        verlay_font = "JetBrainsMono Nerd Font:11";
        overlay_text = ''[$imv_current_index/$imv_file_count] $imv_current_file - $imv_widthx$imv_height'';
        scaling_mode = "full"; # Fit image to window
        upscaling_method = "linear"; # Smooth when zooming
      };
      binds = {
        # Navigation
        "q" = "quit";
        "n" = "next";
        "p" = "prev";
        "gg" = "goto 1";
        "G" = "goto -1";

        # View
        "f" = "fullscreen";
        "r" = "reset";
        "c" = "center";
        "a" = "zoom actual";
        "s" = "scaling next";

        # File operations
        "x" = "close";
        "Delete" = "exec rm \"$imv_current_file\"; close";

        # Copy image path to clipboard
        "y" = "exec echo \"$imv_current_file\" | wl-copy";
      };
    };
  };

  # Set imv as default image viewer for Nautilus
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
      "image/jpg" = ["imv.desktop"];
      "image/gif" = ["imv.desktop"];
      "image/webp" = ["imv.desktop"];
      "image/bmp" = ["imv.desktop"];
      "image/tiff" = ["imv.desktop"];
      "image/x-xpixmap" = ["imv.desktop"];
    };
  };
}
