# home/packages.nix
# User packages and basic program stubs.
# Application-specific configuration lives in the respective module files.

{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # ── Wayland / Desktop ────────────────────────────────────────────────────
    swaynotificationcenter  # Notification daemon (config in desktop/swaync.nix)
    swww                    # Wallpaper daemon
    wl-clipboard            # Wayland clipboard utilities (wl-copy, wl-paste)
    cliphist                # Clipboard history manager (accessible via Super+V)

    # ── Terminal ─────────────────────────────────────────────────────────────
    ghostty                 # Terminal emulator (config in apps/ghostty.nix)

    # ── Launcher ─────────────────────────────────────────────────────────────
    rofi                    # Application launcher (config in apps/rofi.nix)

    # ── File Manager ─────────────────────────────────────────────────────────
    yazi                    # Terminal file manager (config in apps/yazi.nix)

    # ── Screenshots ──────────────────────────────────────────────────────────
    grimblast               # Screenshot tool (keybinds in desktop/hypr/hyprland/keybinds.nix)

    # ── Media & Audio ────────────────────────────────────────────────────────
    playerctl               # Media player control (play, pause, next, previous)

    # ── Brightness ───────────────────────────────────────────────────────────
    brightnessctl           # Screen brightness control

    # ── Network ──────────────────────────────────────────────────────────────
    networkmanagerapplet    # Network manager tray applet (started in desktop/hypr/hyprland/autostart.nix)

    # ── Development ──────────────────────────────────────────────────────────
    jetbrains-toolbox       # JetBrains IDE manager
    cargo                   # Rust package manager
    rustc                   # Rust compiler
    gcc                     # C linker (required by Rust)

    # ── Communication ────────────────────────────────────────────────────────
    tutanota-desktop        # Encrypted email client
    signal-desktop          # Encrypted messenger
    vesktop                 # Discord client with Vencord (better client mods)

    # ── Utilities ────────────────────────────────────────────────────────────
    wlr-randr               # Wayland display configuration tool
    libnotify               # Send desktop notifications from the command line
    fastfetch               # System info
    bat                     # Better cat with syntax highlighting
    tree                    # Directory tree viewer

    # ── Viewer ───────────────────────────────────────────────────────────────
    zathura                 # Minimal PDF viewer with Vim keybindings
    imv                     # Minimal image viewer for Wayland
  ];

  # VS Code – full configuration can be extended here if needed
  programs.vscode.enable = true;

  # direnv – activate Nix shells automatically when entering project directories
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}