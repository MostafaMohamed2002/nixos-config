{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    opencode
  ];

  # OpenCode MCP Configuration
  home.file.".config/opencode/opencode.json".source = ../config/opencode.json;
}
