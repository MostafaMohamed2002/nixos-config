{...}: {
  nix.settings.substituters = [
    "https://cache.nixos.org"
    "https://nix-community.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypG7a8BU0kLBV231fzO15z3Wy7s="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCUSeBc="
  ];
}
