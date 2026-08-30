# Home Manager module imports (mostafa)
{...}: {
  imports = [
    ./base.nix
    ./git.nix
    ./neovim.nix
    ./kitty.nix
    ./mimeapps.nix
    ./xdg-user-dirs.nix
    ./xdg-portal.nix
    ./firefox.nix
    ./htop.nix
    ./bash.nix
    ./systemd.nix
    ./vscode.nix
    ./packages.nix
    ./theme.nix
    ./dunst.nix
    ./rofi.nix
    ./i3.nix
    ./picom.nix
    ./i3status.nix
    ./imv.nix
    ./opencode.nix
  ];
}
