# Main NixOS configuration - pure imports list
{...}: {
  imports = [
    # Hardware scan results
    ./hardware-configuration.nix
    # Modules
    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/packages.nix
    ./modules/users.nix
    ./modules/security.nix
    ./modules/cachix.nix
    ./modules/fonts.nix
    ./modules/nix-ld-dotnet.nix
    ./modules/nvidia.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Its perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
