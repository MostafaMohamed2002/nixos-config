{
  pkgs,
  lib,
  ...
}: let
  dotnetRoot = "${pkgs.dotnet-sdk_10.unwrapped}/share/dotnet";
in {
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    openssl
    icu
    krb5
    libunwind
    curl
  ];

  environment.systemPackages = with pkgs; [dotnet-sdk_10];

  environment.sessionVariables = {
    DOTNET_ROOT = dotnetRoot;
  };

  environment.etc."dotnet/install_location".text =
    lib.mkForce "${dotnetRoot}\n";
  environment.etc."dotnet/install_location_x64".text =
    lib.mkForce "${dotnetRoot}\n";
  environment.etc."dotnet/current".source = "${pkgs.dotnet-sdk_10.unwrapped}/share/dotnet";
}
