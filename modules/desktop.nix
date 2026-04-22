# Display manager, desktop environment, audio (pipewire), and printing
{ pkgs, ... }:
{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Display manager
  services.displayManager.ly.enable = true;

  # Hyprland (Wayland)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # GNOME disabled (using Hyprland)
  services.desktopManager.gnome.enable = false;

  # Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Polkit
  security.polkit.enable = true;

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Uncomment if you want to use JACK applications
    # jack.enable = true;
  };

  # Enable touchpad support (enabled by default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
