# System-wide packages (non-font tools only)
{
  pkgs,
  lib,
  ...
}: {
  # Install firefox (enables Home Manager to manage it)
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  # System-wide packages (only essential system tools)
  environment.systemPackages = with pkgs; [
    ntfs3g # File system driver - system-wide need
    dotnet-sdk_10
  ];
}
