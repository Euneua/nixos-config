# home/default.nix
# Home Manager entry point for the user configuration.
# Imports all application and theme modules.

{ config, pkgs, inputs, ... }:
{
  imports = [
    # ── System ──────────────────────────────────────────────────────────────
    ./packages.nix  # User packages
    ./git.nix       # Git configuration
    ./fonts.nix     # Font packages and fontconfig defaults
    ./gtk.nix       # GTK theme, icons and cursor

    # ── Desktop ─────────────────────────────────────────────────────────────
    ./desktop/hypr/hyprland    # Window manager (imports all hyprland sub-modules)
    ./desktop/hypr/hypridle.nix  # Idle daemon – screen lock and DPMS
    ./desktop/hypr/hyprlock.nix  # Lock screen
    ./desktop/waybar.nix       # Status bar
    ./desktop/swaync.nix       # Notification daemon

    # ── Applications ────────────────────────────────────────────────────────
    ./apps/zsh.nix     # Zsh shell with Starship prompt
    ./apps/ghostty.nix # Terminal emulator
    ./apps/rofi.nix    # Application launcher
    ./apps/yazi.nix    # Terminal file manager
    ./apps/nvim        # Neovim (imports all nvim sub-modules)
    ./apps/firefox.nix # Browser
  ];

  # ── User ──────────────────────────────────────────────────────────────────
  home.username      = "jannick";
  home.homeDirectory = "/home/jannick";
  home.stateVersion  = "25.11";

  programs.home-manager.enable = true;

  # ── XDG ───────────────────────────────────────────────────────────────────
  # Add Flatpak directories to XDG_DATA_DIRS so Rofi can find Flatpak apps
  home.sessionVariables.XDG_DATA_DIRS =
    "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS";

  # ── Cursor ────────────────────────────────────────────────────────────────
  # Sets the cursor system-wide for both Wayland and GTK applications
  home.pointerCursor = {
    gtk.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Classic";
    size       = 24;
  };
}