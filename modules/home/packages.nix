# User-level packages
{
  pkgs,
  input,
  ...
}: {
  home.packages = with pkgs; [
    # Formatters
    alejandra
    nixfmt-rfc-style

    # Development tools
    nh
    nixd
    starship
    eza
    git
    gcc
    ripgrep
    fd
    cmake
    unzip
    sops
    zip
    nodejs
    bun
    xrandr
    arandr
    # Editors
    vim
    claude-code

    # Applications
    kitty
    jetbrains.rider

    # X11 essentials
    rofi
    pamixer
    playerctl
    light
    pavucontrol
    blueman
    mpv
    nwg-look
    picom

    # Terminal productivity
    fzf
    bat
    zoxide
    direnv

    # Storage helpers
    gvfs
    libmtp
    jmtpfs

    # File manager
    nautilus
    nautilus-python
    file-roller
    google-chrome

    localsend
  ];

  services.network-manager-applet.enable = true;
}
