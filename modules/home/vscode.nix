# VSCodium settings (HM programs.vscode module)
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Default Dark Modern";
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
    };
  };
}
