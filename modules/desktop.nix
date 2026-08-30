# Display manager, desktop environment, audio (pipewire), and printing
{ pkgs, ... }:
{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Display manager (sddm works better with nvidia)
  services.displayManager.sddm.enable = true;

  # Set X video driver to nvidia
  services.xserver.videoDrivers = [ "nvidia" ];

  # Autorandr for display configuration
  services.autorandr = {
    enable = true;
    defaultTarget = "default";
    profiles = {
      default = {
        fingerprint = {
          "DP-0" = "vendor-product-model-serial";
        };
        config = {
          "DP-0" = {
            enable = true;
            scale = {
              method = "factor";
              x = 1;
              y = 1;
            };
            rate = "100";
          };
        };
      };
    };
  };

  # Configure keymap in X11 (also in locale.nix for user sessions - kept here for SDDM)
  services.xserver.xkb = {
    layout = "us,ara";
    variant = "";
    options = "grp:win_space_toggle";
  };

  # Systemd override for display manager to wait for tty
  systemd.services.display-manager.after = [
    "systemd-user-sessions.service"
    "multi-user.target"
  ];
  systemd.services.display-manager.wants = [
    "systemd-user-sessions.service"
  ];

  # i3 window manager (X11)
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      i3status-rust
      i3lock
      xss-lock
    ];
  };

  # Portals (GTK for X11)
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # Enable dconf for home-manager compatibility
  programs.dconf.enable = true;

  # Polkit
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.udisks2.filesystem-mount" ||
          action.id == "org.freedesktop.udisks2.filesystem-mount-system") {
        return polkit.Result.YES;
      }
    });
  '';

  # Storage and removable media
  services.udisks2.enable = true;

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
  };
}
