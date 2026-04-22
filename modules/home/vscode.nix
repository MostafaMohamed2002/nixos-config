# VSCodium settings (HM programs.vscode module)
{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
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
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "alajandra" ];
          };
        };
      };
    };
  };
}
