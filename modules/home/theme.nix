# GTK/Theme configuration with Catppuccin Latte
{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-latte-rosewater-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "latte";
        accents = ["rosewater"];
      };
    };
    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
