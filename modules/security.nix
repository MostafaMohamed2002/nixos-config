# Security settings: sudo, SSH, nix experimental features, and allowed users
{ ... }:

{
  # Passwordless sudo for wheel group
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Nix experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Nix garbage collection and store optimization
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true; # deduplicates store via hardlinks

  # OpenSSH daemon (currently disabled, but available for extension)
  # services.openssh.enable = true;
}
