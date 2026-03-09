# nixos-config
My personal NixOS configuration – flake-based with Home Manager, Hyprland and Catppuccin Mocha.
> [!WARNING]
> **Do not blindly copy this configuration.**
> Several settings are specific to my hardware (Intel + NVIDIA RTX 4060 Optimus laptop, WQHD 2560x1600 display).
> Applying this without adjustments may break your system.
> Use it as a reference and adapt it to your own hardware.
## System
| | |
|---|---|
| **OS** | NixOS (unstable) |
| **WM** | Hyprland 0.54.0 |
| **GPU** | Intel + NVIDIA RTX 4060 (Optimus) |
| **Display** | WQHD 2560x1600 (16:10), 1.6x fractional scaling |
| **Terminal** | Ghostty |
| **Editor** | Neovim (programs.neovim + Lua) |
| **Theme** | Catppuccin Mocha |
## Structure
```
/etc/nixos/
├── flake.nix
├── configuration.nix
├── hardware.nix
└── home/
    ├── home.nix
    ├── colors.nix
    ├── packages.nix
    ├── fonts.nix
    ├── gtk.nix
    ├── git.nix
    ├── firefox/
    ├── ghostty/
    ├── rofi/
    ├── waybar/
    ├── swaync/
    ├── yazi/
    ├── nvim/
    │   ├── default.nix
    │   └── lua/
    │       ├── options.lua
    │       ├── keymaps.lua
    │       └── plugins/
    └── hypr/
        ├── hyprland/
        ├── hypridle/
        └── hyprlock/
```
## Components
- **Hyprland** – hjkl navigation, workspaces 1-5 on number keys, 6-10 on z,u,i,o,p
- **Neovim** – plugins via Nix, config in Lua, Catppuccin Mocha, LSP (nixd, pyright), Telescope, LazyGit
- **Ghostty** – JetBrainsMono Nerd Font, ligatures, transparent background
- **Waybar** – workspaces, clock, network, audio, battery, notifications
- **SwayNC** – notification center with Catppuccin Mocha styling
- **Rofi** – app launcher, window switcher, clipboard picker
- **Yazi** – terminal file manager
- **Firefox** – uBlock, Bitwarden, Vimium, Dark Reader, Brave Search
## Hardware-specific files
These files contain settings that are **specific to my machine** and must be adjusted for other hardware:
- `hardware.nix` – NVIDIA Prime offload, PCI Bus IDs
- `hypr/hyprland/monitors.nix` – custom modeline for WQHD display
- `hypr/hyprland/env.nix` – NVIDIA environment variables
## Rebuild
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```
## Notes
The README and all inline comments throughout this configuration were written with the assistance of AI.
