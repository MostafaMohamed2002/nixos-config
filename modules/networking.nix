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
  # Firewall configuration (currently unused, but available for extension)
  # networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
