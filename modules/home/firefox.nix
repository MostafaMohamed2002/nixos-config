# Firefox configuration with GTK theme
{ ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      # Use system colors from GTK theme
      LegacyColorSchemeUseSystem = true;
    };
  };
}
