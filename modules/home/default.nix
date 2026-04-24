# Home Manager module imports (mostafa)
{...}: {
  imports = [
    ./base.nix
    ./git.nix
    ./neovim.nix
    ./ghostty.nix
    ./mimeapps.nix
    ./xdg-user-dirs.nix
    ./firefox.nix
    ./htop.nix
    ./bash.nix
    ./systemd.nix
    ./vscode.nix
    ./packages.nix
    ./theme.nix
    ./dunst.nix
    ./rofi.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar.nix
  ];
}
