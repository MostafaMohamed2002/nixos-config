# Ghostty configuration via Home Manager module
{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      background-opacity = 0.900000;
      cursor-style-blink = false;
      font-family = "Maple Mono NF";
      font-size = 13;
    };
  };
}
