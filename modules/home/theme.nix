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
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    (catppuccin-kvantum.override {
      variant = "latte";
      accent = "rosewater";
    })
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
      package = pkgs.qt6Packages.qtstyleplugin-kvantum;
    };
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Catppuccin-Latte-Rosewater
  '';
}
