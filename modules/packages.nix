# System-wide packages (non-font tools only)
{ pkgs, ... }:

{
  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System-wide packages (only essential system tools)
  environment.systemPackages = with pkgs; [
    ntfs3g # File system driver - system-wide need
    # Development and utilities
    vim
    tree
    opencode
    git
    htop
    gh
    # Terminal and shell
    ghostty
    # GNOME customization
    gnome-tweaks
  ];
}
