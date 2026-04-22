# GTK/Theme configuration with Catppuccin Machiato
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "macchiato";
        accents = [ "mauve" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
