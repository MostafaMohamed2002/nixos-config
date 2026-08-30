# Bootloader, kernel packages, and hardware power management
{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Limit boot menu entries for cleaner menu
  boot.loader.systemd-boot.configurationLimit = 5;

  # Use latest kernel (intentionally unpinned for newest features)
  # To pin a specific version for reproducibility, use:
  # boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.kernelPackages = pkgs.linuxPackages;

  # Set default memory sleep state to s2idle
  boot.kernelParams = ["mem_sleep_default=s2idle"];
}
