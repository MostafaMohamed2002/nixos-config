# Bootloader, kernel packages, and hardware power management
{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # Set default memory sleep state to s2idle
  boot.kernelParams = ["mem_sleep_default=s2idle"];
}
