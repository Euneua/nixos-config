# home/packages.nix
# User packages and basic program stubs.
# Application-specific configuration lives in the respective module files.

{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # ── Wayland / Desktop ────────────────────────────────────────────────────
    swaynotificationcenter  # Notification daemon (config in swaync/swaync.nix)
    swww                    # Wallpaper daemon
    wl-clipboard            # Wayland clipboard utilities (wl-copy, wl-paste)
    cliphist                # Clipboard history manager (accessible via Super+V)

    # ── Terminal ─────────────────────────────────────────────────────────────
    ghostty                 # Terminal emulator (config in ghostty/ghostty.nix)

    # ── Launcher ─────────────────────────────────────────────────────────────
    rofi                    # Application launcher (config in rofi/rofi.nix)

    # ── File Manager ─────────────────────────────────────────────────────────
    yazi                    # Terminal file manager (config in yazi/yazi.nix)

    # ── Screenshots ──────────────────────────────────────────────────────────
    grimblast               # Screenshot tool (keybinds in hyprland/keybinds.nix)

    # ── Media & Audio ────────────────────────────────────────────────────────
    playerctl               # Media player control (play, pause, next, previous)

    # ── Brightness ───────────────────────────────────────────────────────────
    brightnessctl           # Screen brightness control

    # ── Bluetooth ────────────────────────────────────────────────────────────
    blueman                 # Bluetooth manager applet

    # ── Network ──────────────────────────────────────────────────────────────
    networkmanagerapplet    # Network manager tray applet (started in autostart.nix)

    # ── Development ──────────────────────────────────────────────────────────
    jetbrains-toolbox       # JetBrains IDE manager

# ── Communication ────────────────────────────────────────────────────────
    tutanota-desktop        # Encrypted email client
    signal-desktop          # Encrypted messenger
    vesktop                 # Discord client with Vencord (better client mods)

    # ── Utilities / Debugging ────────────────────────────────────────────────
    wlr-randr               # Wayland display configuration tool
    lshw                    # Hardware information
    glmark2                 # OpenGL benchmark
    libnotify               # Send desktop notifications from the command line
    wev                     # Wayland event viewer (useful for finding key names)
    vim                     # Fallback editor
    fastfetch               # a bit showoff

    # ── Screen Recording ─────────────────────────────────────────────────────
    obs-studio
    obs-studio-plugins.obs-vkcapture  # Vulkan/OpenGL game capture for OBS
  ];

  # Waybar and VS Code stubs – full configuration lives in their respective modules
  programs.waybar.enable = true;
  programs.vscode.enable = true;
}
