# User-level packages (empty for now)
{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    gcc
    ripgrep
    tree-sitter
    fd
    cmake
    unzip
    tree

    opencode
    ghostty
    jetbrains.rider
  ];
}
