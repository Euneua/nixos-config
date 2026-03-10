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
| **Editor** | Neovim (pkgs.wrapNeovim + Lua) |
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
    │       ├── init.lua
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
- **Neovim** – plugins via Nix (pkgs.wrapNeovim), config in Lua, Catppuccin Mocha, LSP (nixd, pyright), Telescope, LazyGit
- **Ghostty** – JetBrainsMono Nerd Font, ligatures, transparent background
- **Waybar** – workspaces, clock, network, audio, battery, notifications
- **SwayNC** – notification center with Catppuccin Mocha styling
- **Rofi** – app launcher, window switcher, clipboard picker
- **Yazi** – terminal file manager
- **Firefox** – uBlock, Bitwarden, Vimium, Dark Reader, Brave Search
- **Tuta Mail** – encrypted email client
- **Signal** – encrypted messenger
- **Vesktop** – Discord client with Vencord
- **Steam** – gaming platform
- **Threema** – encrypted messenger (via Flatpak)
## Hardware-specific files
These files contain settings that are **specific to my machine** and must be adjusted for other hardware:
- `hardware.nix` – NVIDIA Prime offload, PCI Bus IDs
- `hypr/hyprland/monitors.nix` – custom modeline for WQHD display
- `hypr/hyprland/env.nix` – NVIDIA environment variables
## Rebuild
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```
## Post-Install Setup
Some steps cannot be automated via Nix and must be done manually after the first rebuild.
### Neovim
Plugins are managed by Nix – only plugin changes require a rebuild. Lua config changes take effect immediately.
After rebuilding, create a symlink so Neovim can find the Lua config:
```bash
ln -s /etc/nixos/home/nvim/lua ~/.config/nvim
```
### Threema
Threema is not available in nixpkgs and must be installed via Flatpak after enabling `services.flatpak`:
```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --from https://releases.threema.ch/flatpak/threema-desktop/ch.threema.threema-desktop.flatpakref
```
### Tuta Mail
After first launch, Tuta will ask to set up a keyring password. Leave it empty so it unlocks automatically on login (recommended for single-user systems with auto-login).
## Notes
The README and all inline comments throughout this configuration were written with the assistance of AI.
