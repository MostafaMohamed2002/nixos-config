# Base Home Manager identity and state version
{ ... }:
{
  home.username = "mostafa";
  home.homeDirectory = "/home/mostafa";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "ghostty";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    WLR_RENDERER = "vulkan";

    # Toolkit - forces native Wayland rendering
    GDK_BACKEND = "wayland,x11,*";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    # Qt theming
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";

    # Fix blurry Electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # Fix broken Java GUIs
    _JAVA_AWT_WM_NONREPARENTING = "1";

    # Nautilus (for i3/Hyprland compatibility)
    NAUTILUS_USE_I3 = "1";
  };
}
