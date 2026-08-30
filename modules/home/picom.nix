# Picom compositor configuration
{...}: {
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    shadow = true;
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    fade = true;
    fadeDelta = 4;

    settings = {
      blur = {
        method = "dual_kawase";
        strength = 5;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      corner-radius = 10;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}
