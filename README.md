# nixos-config

My personal NixOS configuration – flake-based with Home Manager, Hyprland and Catppuccin Mocha.

> [!WARNING]
> **Do not blindly copy this configuration.**
> Several files contain settings that are specific to my hardware, display and username.
> See [Hardware-specific files](#hardware-specific-files) and [Adapting to your system](#adapting-to-your-system) before applying anything.

---

## System

| | |
|---|---|
| **OS** | NixOS (unstable / 26.05 Yarara) |
| **WM** | Hyprland 0.54.0 |
| **GPU** | Intel + NVIDIA RTX 4060 (Optimus laptop) |
| **Display** | WQHD 2560x1600 (16:10), 1.6x fractional scaling |
| **Terminal** | Ghostty |
| **Editor** | Neovim (`pkgs.wrapNeovim` + Lua) |
| **Shell** | Bash (default) |
| **Theme** | Catppuccin Mocha |

---

## Structure

```
/etc/nixos/
├── flake.nix                    # Entry point – inputs and system config
├── configuration.nix            # System-level settings
├── hardware.nix                 # GPU drivers (Intel + NVIDIA Optimus)
├── hardware-configuration.nix   # Auto-generated – do not edit
└── home/
    ├── home.nix                 # Home Manager entry point
    ├── colors.nix               # Central Catppuccin Mocha color definitions
    ├── packages.nix             # User packages and program stubs
    ├── fonts.nix                # JetBrainsMono Nerd Font + Noto Emoji
    ├── gtk.nix                  # GTK theme, icons and cursor
    ├── git.nix                  # Git identity and defaults
    ├── firefox/firefox.nix      # Browser config, extensions, privacy settings
    ├── ghostty/ghostty.nix      # Terminal emulator
    ├── rofi/rofi.nix            # App launcher + cheatsheet.rasi (auto-generated)
    ├── waybar/waybar.nix        # Status bar
    ├── swaync/swaync.nix        # Notification daemon
    ├── yazi/yazi.nix            # Terminal file manager
    ├── scripts/
    │   └── cheatsheet/          # Keybind cheatsheet tool (Rust)
    │       ├── default.nix      # Nix derivation
    │       ├── Cargo.toml
    │       └── src/
    │           ├── main.rs
    │           ├── rofi.rs
    │           └── parser/
    │               ├── mod.rs
    │               ├── hyprland.rs
    │               └── neovim.rs
    ├── nvim/
    │   ├── default.nix          # Neovim with plugins via Nix
    │   └── lua/
    │       ├── init.lua
    │       ├── options.lua
    │       ├── keymaps.lua
    │       └── plugins/
    │           ├── ui.lua
    │           ├── editor.lua
    │           ├── telescope.lua
    │           ├── git.lua
    │           ├── lsp.lua
    │           └── cmp.lua
    └── hypr/
        ├── hyprland/
        │   ├── default.nix
        │   ├── variables.nix    # Gaps, borders, animations
        │   ├── env.nix          # Session environment variables
        │   ├── monitors.nix     # Monitor layout and scaling ⚠️
        │   ├── input.nix        # Keyboard, mouse, touchpad
        │   ├── keybinds.nix     # All keybindings
        │   ├── window-rules.nix
        │   ├── layer-rules.nix
        │   ├── workspaces.nix
        │   ├── autostart.nix
        │   ├── dwindle.nix
        │   ├── master.nix
        │   ├── gestures.nix
        │   ├── misc.nix
        │   └── xwayland.nix
        ├── hypridle/hypridle.nix
        └── hyprlock/hyprlock.nix
```

---

## Components

### Window Manager – Hyprland
- hjkl navigation (Vim-style focus and window movement)
- Workspaces 1–5 on number keys, 6–10 on `z u i o p`
- Dwindle tiling layout
- Touchpad gestures (3-finger swipe)
- Fractional scaling via custom modeline

### Editor – Neovim
- Plugins managed via Nix (`pkgs.wrapNeovim`), Lua config loaded at runtime
- Lua changes take effect immediately without a rebuild
- Theme: Catppuccin Mocha
- LSP: `nixd` (Nix), `pyright` (Python)
- Plugins: Telescope, LazyGit, neo-tree, lualine, bufferline, which-key, noice, conform, treesitter, nvim-cmp

### Keybind Cheatsheet – `cheatsheet`
- Written in Rust, built via Nix
- Parses `keybinds.nix` and `keymaps.lua` live
- Opens as a Rofi overlay
- Category prefixes `[H]` `[N]` `[B]` colored from `colors.nix` at compile time
- Keybinds: `Super+C` (all), `Super+Shift+C` (Hyprland), `Super+Ctrl+C` (Neovim)

### Bar – Waybar
- Modules: workspaces, clock (with calendar tooltip), network, audio, battery, notification bell
- Started as a systemd user service

### Other Applications
| App | Notes |
|-----|-------|
| Ghostty | JetBrainsMono Nerd Font, ligatures, transparent background |
| Rofi | App launcher, window switcher, clipboard picker |
| SwayNC | Notification center |
| Yazi | Terminal file manager |
| Firefox | uBlock Origin, Bitwarden, Vimium, Dark Reader, Brave Search |
| Tuta Mail | Encrypted email (native package) |
| Signal | Encrypted messenger |
| Vesktop | Discord with Vencord |
| Steam | Via `programs.steam.enable` |
| Threema | Encrypted messenger (Flatpak) |
| JetBrains Toolbox | IDE manager |

---

## Theming

Colors are defined centrally in `home/colors.nix` (Catppuccin Mocha palette) and imported wherever needed. Changing a value in `colors.nix` and rebuilding propagates the change to:

- Hyprland borders and decorations
- Waybar, SwayNC, Rofi, Yazi, Ghostty, Hyprlock
- Rofi `cheatsheet.rasi` (auto-generated via `home.file`)
- Cheatsheet prefix colors (injected as compile-time env vars)

---

## Hardware-specific files

These files **must be adapted** before using this config on a different machine:

| File | What to change |
|------|---------------|
| `hardware.nix` | PCI Bus IDs (`intelBusId`, `nvidiaBusId`), NVIDIA driver settings |
| `hardware-configuration.nix` | Regenerate with `nixos-generate-config` on your machine |
| `hypr/hyprland/monitors.nix` | Monitor name (`eDP-1`), modeline, resolution, scaling |
| `hypr/hyprland/env.nix` | Remove NVIDIA vars if you don't have an NVIDIA GPU |
| `firefox/firefox.nix` | `media.ffmpeg.vaapi.enabled` – Intel VA-API specific |

---

## Adapting to your system

**1. Username** – `jannick` appears in:
- `configuration.nix` → `users.users.jannick` and `autoLogin.user`
- `home/home.nix` → `home.username` and `home.homeDirectory`
- `home/scripts/cheatsheet/src/rofi.rs` → `ROFI_THEME` path

**2. GPU** – If you don't have an Intel + NVIDIA Optimus setup:
- Replace or remove `hardware.nix`
- Remove NVIDIA-specific entries from `env.nix`
- Regenerate `hardware-configuration.nix`

**3. Display** – If your monitor is different:
- Update `monitors.nix` with your monitor name and resolution
- Adjust or remove the custom modeline and scaling factor

**4. Keyboard layout** – Currently set to `de` (German) in:
- `configuration.nix` → `services.xserver.xkb.layout` and `console.keyMap`
- `hypr/hyprland/input.nix` → `kb_layout`

---

## Flake inputs

| Input | Source |
|-------|--------|
| `nixpkgs` | `github:nixos/nixpkgs/nixos-unstable` |
| `home-manager` | `github:nix-community/home-manager` |
| `hyprland` | `github:hyprwm/hyprland` |
| `firefox-addons` | `gitlab:rycee/nur-expressions` |

---

## Rebuild

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

Always stage changes before rebuilding (Flakes only read tracked files):

```bash
git add -A
sudo nixos-rebuild switch --flake /etc/nixos#nixos
git commit -m "your message"
```

---

## Post-install setup

Some steps cannot be automated via Nix and must be done manually after the first rebuild.

### Neovim
Plugins are managed by Nix. Lua config changes take effect immediately without a rebuild. After the first rebuild, create the symlink so Neovim finds the Lua config:

```bash
ln -s /etc/nixos/home/nvim/lua ~/.config/nvim
```

### Threema
Not available in nixpkgs – install via Flatpak after enabling `services.flatpak`:

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --from https://releases.threema.ch/flatpak/threema-desktop/ch.threema.threema-desktop.flatpakref
```

### Tuta Mail
On first launch, Tuta will ask to set up a keyring password. Leave it empty for automatic unlock on login (recommended for single-user systems with auto-login enabled).

### Wallpaper
The autostart config expects a wallpaper at `~/Pictures/wallpapers/wallpaper.jpg`. Place your wallpaper there or update the path in `hypr/hyprland/autostart.nix` and `hypr/hyprlock/hyprlock.nix`.

---

## Notes

- All inline comments throughout the configuration are written in English
- The README and inline comments were written with AI assistance
