# User-level packages
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Formatters
    alejandra
    nixfmt-rfc-style

    # Development tools
    nixd
    starship
    eza

    # Development tools
    git
    gcc
    ripgrep
    fd
    cmake
    unzip

    # Editors
    vim
    opencode

    # Applications
    ghostty
    jetbrains.rider
  ];
}
