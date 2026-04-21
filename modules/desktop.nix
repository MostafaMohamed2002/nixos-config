# Display manager, desktop environment, audio (pipewire), and printing
{ ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment
  services.desktopManager.gnome.enable = true;
  services.displayManager.ly.enable = true;

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
