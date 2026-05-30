# nixos-config

My personal NixOS configuration – flake-based with Home Manager, Hyprland (Lua config) and a custom theming system.

> [!WARNING]
> **Do not blindly copy this configuration.**
> Several files contain settings that are specific to my hardware, display and username.
> See [Hardware-specific files](#hardware-specific-files) and [Adapting to your system](#adapting-to-your-system) before applying anything.

---

## System

| | |
|---|---|
| **OS** | NixOS (unstable) |
| **Hostname** | thinkbook |
| **WM** | Hyprland (from flake, Lua-based config) |
| **GPU** | Intel + NVIDIA RTX 4060 (Optimus laptop) |
| **Display** | WQHD 2560×1600 (16:10), 1.6× fractional scaling |
| **Terminal** | Ghostty |
| **Editor** | Neovim (`pkgs.wrapNeovim` + Lua, plugins via Nix) |
| **Shell** | Zsh + Starship |
| **Theme** | Custom (Vesper / Ember – switchable via `home/colors/theme.nix`) |

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
    ├── packages.nix                  # User packages
    ├── fonts.nix                     # JetBrainsMono Nerd Font + Noto Color Emoji
    ├── gtk.nix                       # GTK theme, icons, cursor
    ├── git.nix
    ├── colors/
    │   ├── theme.nix                 # Active theme selector ← change theme here
    │   ├── colors-vesper.nix         # Warm dark + lavender accents
    │   ├── colors-ember.nix          # Warm dark + red accents
    │   └── colors-template.nix       # Template for custom themes
    ├── apps/
    │   ├── firefox.nix
    │   ├── ghostty.nix
    │   ├── rofi.nix
    │   ├── yazi.nix
    │   ├── zsh.nix
    │   └── nvim/
    │       ├── default.nix           # Plugins + LSP servers via Nix, colors.lua generated at build
    │       └── lua/                  # Lua config (symlinked to ~/.config/nvim)
    │           ├── init.lua
    │           ├── options.lua
    │           ├── keymaps.lua
    │           └── plugins/
    │               ├── ui.lua        # Colorscheme, statusline, which-key
    │               ├── editor.lua    # Autopairs, surround, indent guides, conform
    │               ├── navigation.lua # Flash, Harpoon, Oil
    │               ├── telescope.lua
    │               ├── git.lua       # Gitsigns
    │               ├── lsp.lua
    │               ├── cmp.lua       # blink.cmp
    │               ├── trouble.lua
    │               ├── obsidian.lua
    │               └── render-markdown.lua
    └── desktop/
        ├── waybar.nix
        ├── swaync.nix
        ├── wallpaper.nix             # awww daemon + 10-phase time-based switcher
        └── hypr/
            ├── hypridle.nix
            ├── hyprlock.nix
            └── hyprland/
                ├── default.nix       # Hyprland enable + colors.lua injection
                └── lua/              # Lua config (symlinked to ~/.config/hypr)
                    ├── hyprland.lua  # Entry point
                    ├── env.lua
                    ├── monitors.lua  # ⚠️ hardware-specific
                    ├── autostart.lua
                    ├── misc.lua
                    ├── xwayland.lua
                    ├── permissions.lua
                    ├── scripts.lua
                    ├── appearance/
                    │   ├── general.lua
                    │   ├── decoration.lua
                    │   └── animations.lua
                    ├── input/
                    │   ├── keyboard.lua
                    │   ├── mouse.lua
                    │   ├── touchpad.lua
                    │   ├── gestures.lua
                    │   └── devices.lua
                    ├── layouts/
                    │   ├── dwindle.lua
                    │   ├── master.lua
                    │   └── scrolling.lua
                    ├── binds/
                    │   ├── apps.lua
                    │   ├── windows.lua
                    │   ├── workspaces.lua
                    │   ├── media.lua
                    │   └── submaps.lua
                    └── rules/
                        ├── window-rules.lua
                        ├── layer-rules.lua
                        ├── workspace-rules.lua
                        └── scratchpads.lua
```

---

## Theming

Colors are defined in `home/colors/` and propagate system-wide at build time. Every application reads from the same palette — Hyprland, Waybar, SwayNC, Rofi, Yazi, Ghostty, Hyprlock, the Starship prompt and a generated `colors.lua` for Neovim.

**To switch themes**, edit `home/colors/theme.nix`:

```nix
let
  active = "vesper"; # or "ember"
```

Then rebuild. No other files need to change.

**To create a new theme**, copy `colors-template.nix`, fill in your hex values and add it to the `themes` attrset in `theme.nix`.

| Theme | Description |
|-------|-------------|
| `vesper` | Warm dark base, lavender + beige accents |
| `ember` | Warm dark base, red accents |

---

## Keybinds

### Hyprland

| Key | Action |
|-----|--------|
| `Super + Return` | Terminal (Ghostty) |
| `Super + Space` | App launcher (Rofi drun) |
| `Super + Tab` | Window switcher (Rofi window) |
| `Super + B` | Browser (Firefox) |
| `Super + E` | File manager (Yazi) |
| `Super + G` | Git TUI (lazygit) |
| `Super + V` | Clipboard picker (cliphist) |
| `Super + c` | Cheatsheet |
| `Super + Shift + c` | Cheatsheet – Hyprland |
| `Super + Ctrl + c` | Cheatsheet – Neovim |
| `Super + Q` | Kill window |
| `Super + F` | True fullscreen |
| `Super + Shift + F` | Maximize (keep gaps) |
| `Super + T` | Toggle float |
| `Super + P` | Toggle pseudo-tile |
| `Super + h/j/k/l` | Focus window |
| `Super + Shift + h/j/k/l` | Move window |
| `Super + Ctrl + h/j/k/l` | Resize window |
| `Super + 1–5` | Switch workspace 1–5 |
| `Super + z/u/i/o/p` | Switch workspace 6–10 |
| `Super + Shift + 1–5` | Move window to workspace |
| `Super + ^` | Toggle terminal scratchpad |
| `Print` | Screenshot area |
| `Shift + Print` | Screenshot screen |
| `Super + Print` | Screenshot active window |

### Neovim

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>e` | File manager (Oil, current dir) |
| `<leader>E` | File manager (Oil, root) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>ft` | Search TODOs |
| `<leader>a` | Harpoon add file |
| `<leader>h` | Harpoon menu |
| `<leader>1–4` | Harpoon jump to file |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>xx` | Toggle diagnostics |
| `<leader>xb` | Buffer diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xr` | LSP references |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `]g / [g` | Next / prev hunk |
| `<S-l> / <S-h>` | Next / prev buffer |
| `<C-d> / <C-u>` | Scroll down / up (centered) |

---

## Neovim

Plugins are managed by Nix via `pkgs.wrapNeovim`. Lua config lives in `home/apps/nvim/lua/` and is symlinked to `~/.config/nvim` at build time — edits there take effect **immediately without a rebuild**.

Only changes to `default.nix` (plugins, LSP servers, theme) require `nixos-rebuild switch`.

A `colors.lua` is auto-generated from the active Nix theme and injected into `~/.config/nvim/colors.lua` at build time, so the colorscheme stays in sync without any external colorscheme plugin.

**LSP servers included:** nixd, pyright, rust-analyzer, lua_ls, taplo, ts_ls, svelte

**Formatters included:** nixfmt, rustfmt, black, stylua, taplo, prettier

---

## Wallpaper

The wallpaper system uses `awww` as the daemon and switches wallpapers based on the time of day relative to sunrise/sunset at your location (currently Wedel, Germany).

**10 phases:** `midnight` → `predawn` → `dawn` → `sunrise` → `morning` → `day` → `dusk` → `evening` → `night` → `latenight`

Place wallpapers at:
```
~/Pictures/wallpapers/wallpaper-midnight.png
~/Pictures/wallpapers/wallpaper-predawn.png
... (one per phase)
```

The switcher runs every 30 minutes via a systemd timer. To change the location, edit `wallpaperScript` in `home/desktop/wallpaper.nix`.

---

## Hardware-specific files

| File | What to change |
|------|----------------|
| `hosts/thinkbook/hardware.nix` | PCI Bus IDs (`intelBusId`, `nvidiaBusId`), NVIDIA driver settings |
| `hosts/thinkbook/hardware-configuration.nix` | Regenerate with `nixos-generate-config` on your machine |
| `home/desktop/hypr/hyprland/lua/monitors.lua` | Monitor name, modeline, resolution, scaling |
| `home/desktop/hypr/hyprland/lua/env.lua` | Remove NVIDIA vars if no NVIDIA GPU |
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
- Remove NVIDIA-specific entries from `home/desktop/hypr/hyprland/lua/env.lua`
- Regenerate `hardware-configuration.nix`

**4. Display** – Update `monitors.lua` with your monitor name, resolution and scaling factor.

**5. Keyboard layout** – Currently `de` (German) in:
- `hosts/thinkbook/default.nix` → `services.xserver.xkb.layout` and `console.keyMap`
- `home/desktop/hypr/hyprland/lua/input/keyboard.lua` → `kb_layout`

**6. Wallpaper location** – Update the latitude/longitude in `home/desktop/wallpaper.nix` for correct sunrise/sunset times.

---

## Flake inputs

| Input | Source |
|-------|--------|
| `nixpkgs` | `github:nixos/nixpkgs/nixos-unstable` |
| `home-manager` | `github:nix-community/home-manager` |
| `hyprland` | `github:hyprwm/hyprland` |
| `awww` | `git+https://codeberg.org/LGFae/awww` |
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

### Wallpapers
Place one image per phase in `~/Pictures/wallpapers/` named `wallpaper-<phase>.png`.
The lock screen uses `~/Pictures/wallpapers/wallpaper.jpg` — update the path in `home/desktop/hypr/hyprlock.nix` if needed.
