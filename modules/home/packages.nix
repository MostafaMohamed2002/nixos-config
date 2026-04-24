# User-level packages
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Formatters
    alejandra
    nixfmt-rfc-style

    # Development tools
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

    # Editors
    vim
    opencode
    claude-code

    # Applications
    ghostty
    jetbrains.rider

    # Hyprland essentials
    waybar
    swww
    grim
    slurp
    wl-clipboard
    pamixer
    playerctl
    light
    pavucontrol
    blueman
    mpv
    nwg-look
    # Launcher
    rofi
    hyprlock

    # Storage helpers
    gvfs
    libmtp
    jmtpfs

    # File manager
    nautilus
    nautilus-python
    file-roller

    localsend
  ];
}
