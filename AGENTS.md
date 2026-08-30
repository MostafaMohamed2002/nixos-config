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
│   ├── packages.nix             # System packages
│   └── home/                    # Home Manager modules
│       ├── default.nix          # Home Manager imports
│       ├── packages.nix         # User packages
│       ├── i3.nix              # i3 (X11) window manager
│       └── ...                 # Other user configurations
```

## Core Agent Guidelines
- **Always verify your assumptions** before proposing changes. Read relevant `.nix` files first.
- **Do not introduce arbitrary bash scripts** into i3 or similar configs. Prefer native Nix declarative configurations or systemd user services.
- **Check format before committing**: Always run `alejandra .` to ensure the formatting matches project standards.

## Build/Lint/Test Commands

### Evaluating Configuration
Use evaluation commands to check syntax and structure without building:
```bash
nix eval .#nixosConfigurations.nixos.config.system.build.toplevel
nix flake show
nix eval .#nixosConfigurations.nixos.config.home-manager.users.mostafa.home.sessionVariables
```

### Testing Single Modules
```bash
nix-instantiate --parse modules/desktop.nix
nix-instantiate --parse configuration.nix
nix-eval-strict modules/home/hyprland.nix
```

### Building and Switching
Always build configuration first to check for evaluation errors:
```bash
sudo nixos-rebuild build --flake .#
```
Apply the configuration:
```bash
sudo nixos-rebuild switch --flake .#
```
Test changes temporarily (lost on reboot):
```bash
sudo nixos-rebuild test --flake .#
```

### Linting and Formatting
Check and apply formatting:
```bash
alejandra .
alejandra --check .
nix flake check
```

## Code Style Guidelines

### File Organization
Each module should have a descriptive header comment and use the NixOS/Home Manager module system:
```nix
{ config, pkgs, lib, ... }:
{
  # options here
}
```
Group related settings together. Use imports to split large modules into focused files.

### Naming Conventions
- **Files**: kebab-case (e.g., `hyprland.nix`, `xdg-user-dirs.nix`)
- **Options**: follow NixOS naming (e.g., `services.xserver.enable`)
- **Variables**: camelCase for Nix, snake_case for shell scripts

### Imports
Place imports at the top of files after the header comment. Use relative paths for local modules. Order imports: NixOS modules first, then local modules.
```nix
{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption;
in
{
  imports = [ ./modules/foo.nix ];
}
```

### Formatting
- 2-space indentation
- Lines under 80 characters when practical
- Trailing commas for better diffs (alejandra handles this)
- Blank lines between logical sections
- Use `let ... in` for local bindings before the main attribute set

### Types and Validation
- Use `lib.mkEnableOption` for boolean options
- Use `lib.mkOption` with `type = lib.types.*` for typed options
- Use Home Manager's built-in option types
- Use `mkIf` / `mkWhen` for conditionals (avoid `if then`)

### Error Handling
- Use `lib.warn` for warnings
- Use `lib.assertionMsg` for meaningful errors
- Validate required options with assertions

### Package Management & Systemd
- Prefer flake inputs over `fetchurl`/`fetchFromGitHub`
- Add system packages to `modules/packages.nix`
- Add user packages to `modules/home/packages.nix`
- **Use systemd user services** instead of background processes or delayed sleep commands in i3 config (e.g., use `services.udiskie.enable = true` instead of `exec udiskie &`).

### Home Manager Specific
- Use `home.packages` for user packages
- Use `xdg.configFile` for dotfiles
- Use `home.file` for single file configurations
- Use `home.sessionVariables` for environment variables

## Common Tasks

### Adding a New Package
1. Add to `modules/home/packages.nix` (user) or `modules/packages.nix` (system)
2. Run `alejandra .` to format
3. Build the configuration `sudo nixos-rebuild build --flake .#`

### Adding a New Module
1. Create new file in `modules/` or `modules/home/`
2. Import it in `configuration.nix` or `modules/home/default.nix`
3. Add configuration options
4. Format with `alejandra .`