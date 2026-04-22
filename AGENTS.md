# AGENTS.md - NixOS Configuration Guidelines

This repository contains a NixOS system configuration using Nix flakes and Home Manager.

## Project Structure

```
nixos-config/
├── flake.nix                    # Flake entry point
├── configuration.nix            # Main NixOS module
├── hardware-configuration.nix   # Hardware-specific config (auto-generated)
├── modules/
│   ├── desktop.nix              # Display manager, Pipewire, printing
│   ├── boot.nix                 # Boot configuration
│   ├── locale.nix               # Locale settings
│   ├── networking.nix           # Network configuration
│   ├── packages.nix             # System packages
│   ├── users.nix                # User configuration
│   ├── security.nix             # Security settings
│   ├── cachix.nix               # Cachix configuration
│   ├── fonts.nix                # Font configuration
│   ├── nvidia.nix               # NVIDIA driver setup
│   ├── nix-ld-dotnet.nix        # .NET runtime configuration
│   └── home/                    # Home Manager modules
│       ├── default.nix          # Home Manager imports
│       ├── base.nix             # Base home configuration
│       ├── packages.nix         # User packages
│       ├── bash.nix             # Bash configuration
│       ├── git.nix              # Git configuration
│       ├── neovim.nix           # Neovim configuration
│       ├── ghostty.nix          # Ghostty terminal
│       ├── hyprland.nix         # Hyprland (Wayland) window manager
│       ├── waybar.nix           # Waybar status bar
│       ├── rofi.nix             # Rofi launcher
│       ├── dunst.nix            # Dunst notifications
│       ├── theme.nix            # Theme (Catppuccin)
│       ├── firefox.nix          # Firefox configuration
│       ├── vscode.nix           # VSCode configuration
│       ├── htop.nix             # htop configuration
│       ├── systemd.nix          # User systemd services
│       ├── xdg-user-dirs.nix    # XDG user directories
│       └── mimeapps.nix         # MIME application associations
```

## Build/Lint/Test Commands

### Evaluating Configuration
```bash
nix eval .#nixosConfigurations.nixos.config.system.build.toplevel
nix flake show
```

### Building and Switching
```bash
sudo nixos-rebuild switch --flake .#
sudo nixos-rebuild build --flake .#
```

### Linting and Formatting
```bash
alejandra .
alejandra --check .
nix flake check
```

### Testing Single Modules
```bash
nix eval .#nixosConfigurations.nixos.config.home-manager.users.mostafa.home.sessionVariables
nix-instantiate --parse modules/desktop.nix
```

## Code Style Guidelines

### File Organization
- Each module: descriptive comment header, use NixOS/Home Manager module system (`{ config, pkgs, lib, ... }:`)
- Group related settings together
- Use imports to split large modules into smaller, focused files

### Naming Conventions
- **Files**: kebab-case (e.g., `hyprland.nix`, `xdg-user-dirs.nix`)
- **Options**: follow NixOS naming (e.g., `services.xserver.enable`)
- **Variables**: camelCase for Nix, snake_case for shell scripts

### Nix Language Style
```nix
let
  monitorScript = pkgs.writeShellScriptBin "name" ''
    # shell code here
  '';
in
{
  home.packages = with pkgs; [
    package1
    package2
  ];

  programs.hyprland = {
    enable = true;
    inherit (config.some.value) field;
  };
}
```

### Imports
- Place imports at top of files after header comment
- Use relative paths for local modules (`./modules/foo.nix`)
- Order: NixOS modules first, then local modules

### Formatting
- 2-space indentation
- Lines under 80 characters when practical
- Trailing commas for better diffs (alejandra handles this)
- Blank lines between logical sections

### Types and Validation
- Use `lib.mkEnableOption` for boolean options
- Use `lib.mkOption` with `type = lib.types.*` for typed options
- Leverage Home Manager's built-in option types

### Error Handling
- Use `lib.warn` or `lib.assertionMsg` for meaningful errors
- Use `mkIf` / `mkWhen` for conditionals (not `if then`)

### Shell Scripts
- Use `pkgs.writeShellScriptBin` for custom scripts
- Prefer systemd user services over background processes

### Package Management
- Use `with pkgs;` to import packages in scope
- Prefer flake inputs over fetchurl/fetchFromGitHub

### Home Manager Specific
- Use `home.packages` for user packages
- Use `xdg.configFile` for dotfiles
- Use `home.file` for single file configurations
- Use `home.sessionVariables` for environment variables

## Editor Setup

This project uses:
- **alejandra** - The Nix formatter (included in user packages)
- **nixfmt-rfc-style** - Alternative formatter
- **nixd** - Nix language server

Neovim config is in `modules/config/nvim/` with Catppuccin theme, Neo-tree, and nvim-web-devicons.

## Common Tasks

### Adding a New Package
1. Add to `modules/home/packages.nix` (user) or `modules/packages.nix` (system)
2. Run `alejandra .` to format

### Adding a New Home Manager Module
1. Create new file in `modules/home/`
2. Import it in `modules/home/default.nix`
3. Add configuration

### Adding a New System Module
1. Create new file in `modules/`
2. Import it in `configuration.nix`
3. Add configuration

### Testing Changes
```bash
nix-instantiate --parse configuration.nix
nix eval .#nixosConfigurations.nixos.config.system.build.toplevel --dry-run
sudo nixos-rebuild build --flake .#
```