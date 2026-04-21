# VSCodium settings (HM programs.vscode module)
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Default Light Modern";
      "editor.fontFamily" = "Maple Mono NF";
      "editor.fontSize" = 13;
      "editor.lineHeight" = 22;
      "editor.fontLigatures" = true;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.renderWhitespace" = "boundary";
      "editor.cursorBlinking" = "smooth";
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "git.autofetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd"; # Points to the nixd binary in your path
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ]; # Optional: requires pkgs.nixfmt-rfc-style
          };
        };
      };
    };
  };
}
