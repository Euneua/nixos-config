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
| **Hostname** | thinkbook |
| **WM** | Hyprland 0.54.0 |
| **GPU** | Intel + NVIDIA RTX 4060 (Optimus laptop) |
| **Display** | WQHD 2560x1600 (16:10), 1.6x fractional scaling |
| **Terminal** | Ghostty |
| **Editor** | Neovim (`pkgs.wrapNeovim` + Lua) |
| **Shell** | Zsh + Starship |
| **Theme** | Catppuccin Mocha |

---

## Structure
```
/etc/nixos/
├── flake.nix
├── flake.lock
├── README.md
├── hosts/
│   └── thinkbook/
│       ├── default.nix               # System-level settings
│       ├── hardware.nix              # GPU drivers (Intel + NVIDIA Optimus)
│       └── hardware-configuration.nix  # Auto-generated – do not edit
└── home/
    ├── default.nix                   # Home Manager entry point
    ├── colors.nix                    # Central Catppuccin Mocha color definitions
    ├── packages.nix                  # User packages
    ├── fonts.nix
    ├── gtk.nix
    ├── git.nix
    ├── apps/
    │   ├── firefox.nix
    │   ├── ghostty.nix
    │   ├── rofi.nix
    │   ├── yazi.nix
    │   ├── zsh.nix
    │   └── nvim/
    │       ├── default.nix           # Plugins via Nix
    │       └── lua/                  # Lua config (symlinked to ~/.config/nvim)
    │           ├── init.lua
    │           ├── options.lua
    │           ├── keymaps.lua
    │           └── plugins/
    └── desktop/
        ├── waybar.nix
        ├── swaync.nix
        └── hypr/
            ├── hypridle.nix
            ├── hyprlock.nix
            └── hyprland/
                ├── default.nix
                ├── variables.nix     # Gaps, borders, animations
                ├── env.nix           # Session environment variables
                ├── monitors.nix      # Monitor layout and scaling ⚠️
                ├── input.nix
                ├── keybinds.nix
                ├── window-rules.nix
                ├── layer-rules.nix
                ├── workspaces.nix
                ├── autostart.nix
                ├── dwindle.nix
                ├── master.nix
                ├── gestures.nix
                ├── misc.nix
                └── xwayland.nix
```

---

## Keybinds

### Hyprland

| Key | Action |
|-----|--------|
| `Super + Return` | Terminal (Ghostty) |
| `Super + Space` | App launcher (Rofi) |
| `Super + B` | Browser (Firefox) |
| `Super + E` | File manager (Yazi) |
| `Super + G` | Git TUI (lazygit) |
| `Super + V` | Clipboard picker |
| `Super + Tab` | Window switcher |
| `Super + Q` | Kill window |
| `Super + F` | Fullscreen |
| `Super + T` | Toggle float |
| `Super + h/j/k/l` | Focus window |
| `Super + Shift + h/j/k/l` | Move window |
| `Super + Ctrl + h/j/k/l` | Resize window |
| `Super + 1–5` | Switch workspace |
| `Super + z/u/i/o/p` | Workspace 6–10 |
| `Super + Shift + 1–5` | Move to workspace |
| `Print` | Screenshot area |
| `Shift + Print` | Screenshot screen |

### Neovim

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>e` | File manager (Oil) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>ft` | Search TODOs |
| `<leader>a` | Harpoon add file |
| `<leader>h` | Harpoon menu |
| `<leader>1–4` | Harpoon jump |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>xx` | Diagnostics |
| `<leader>gg` | LazyGit |
| `<leader>gp` | Preview hunk |
| `]g / [g` | Next/prev hunk |
| `<S-l> / <S-h>` | Next/prev buffer |

---

## Theming

Colors are defined centrally in `home/colors.nix` (Catppuccin Mocha palette) and imported wherever needed. Changing a value in `colors.nix` and rebuilding propagates the change to Hyprland, Waybar, SwayNC, Rofi, Yazi, Ghostty, Hyprlock and the Zsh Starship prompt.

Neovim uses `catppuccin-nvim` directly for deep plugin integration rather than `colors.nix`.

---

## Hardware-specific files

| File | What to change |
|------|---------------|
| `hosts/thinkbook/hardware.nix` | PCI Bus IDs (`intelBusId`, `nvidiaBusId`), NVIDIA driver settings |
| `hosts/thinkbook/hardware-configuration.nix` | Regenerate with `nixos-generate-config` on your machine |
| `home/desktop/hypr/hyprland/monitors.nix` | Monitor name, modeline, resolution, scaling |
| `home/desktop/hypr/hyprland/env.nix` | Remove NVIDIA vars if no NVIDIA GPU |
| `home/apps/firefox.nix` | `media.ffmpeg.vaapi.enabled` – Intel VA-API specific |

---

## Adapting to your system

**1. Hostname** – `thinkbook` appears in:
- `hosts/thinkbook/default.nix` → `networking.hostName`
- `flake.nix` → `nixosConfigurations.thinkbook`
- `home/apps/zsh.nix` → `rebuild` alias

**2. Username** – `jannick` appears in:
- `hosts/thinkbook/default.nix` → `users.users.jannick` and `autoLogin.user`
- `home/default.nix` → `home.username` and `home.homeDirectory`
- `flake.nix` → `home-manager.users.jannick`

**3. GPU** – If you don't have an Intel + NVIDIA Optimus setup:
- Replace or remove `hosts/thinkbook/hardware.nix`
- Remove NVIDIA-specific entries from `home/desktop/hypr/hyprland/env.nix`
- Regenerate `hardware-configuration.nix`

**4. Display** – Update `monitors.nix` with your monitor name, resolution and scaling factor.

**5. Keyboard layout** – Currently `de` (German) in:
- `hosts/thinkbook/default.nix` → `services.xserver.xkb.layout` and `console.keyMap`
- `home/desktop/hypr/hyprland/input.nix` → `kb_layout`

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
git add -A
sudo nixos-rebuild switch --flake /etc/nixos#thinkbook
git commit -m "your message"
```

---

## Post-install

### Threema
```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --from https://releases.threema.ch/flatpak/threema-desktop/ch.threema.threema-desktop.flatpakref
```

### Tuta Mail
On first launch, leave the keyring password empty for automatic unlock on login.

### Wallpaper
Place your wallpaper at `~/Pictures/wallpapers/wallpaper.jpg` or update the path in:
- `home/desktop/hypr/hyprland/autostart.nix`
- `home/desktop/hypr/hyprlock.nix`
