# Hostname, NetworkManager, iwd wireless backend, and firewall configuration
{...}: {
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  #bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowedUDPPorts = [
    53317
    30317
  ];
  networking.firewall.allowedTCPPorts = [
    53317
    30317
  ];
}
