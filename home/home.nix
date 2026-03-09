# home/home.nix
# Home Manager entry point for the user configuration.
# Imports all application and theme modules.

{ config, pkgs, inputs, ... }:
{
  imports = [

    # ── System ────────────────────────────────────────────────────────────────
    ./packages.nix   # User packages
    ./git.nix        # Git configuration
    ./fonts.nix      # Font packages and fontconfig defaults
    ./gtk.nix        # GTK theme, icons and cursor

    # ── Hyprland ──────────────────────────────────────────────────────────────
    ./hypr/hyprland          # Window manager (imports all hyprland sub-modules)
    ./hypr/hypridle/hypridle.nix  # Idle daemon – screen lock and DPMS
    ./hypr/hyprlock/hyprlock.nix  # Lock screen

    # ── Applications ──────────────────────────────────────────────────────────
    ./ghostty/ghostty.nix    # Terminal emulator
    ./rofi/rofi.nix          # Application launcher
    ./waybar/waybar.nix      # Status bar
    ./swaync/swaync.nix      # Notification daemon
    ./yazi/yazi.nix          # Terminal file manager
    ./nvim                   # Neovim (imports all nvim sub-modules)
    ./firefox/firefox.nix    # Browser
  ];

  # ── User ────────────────────────────────────────────────────────────────────
  home.username    = "jannick";
  home.homeDirectory = "/home/jannick";
  home.stateVersion  = "25.11";

  programs.home-manager.enable = true;

  # ── XDG ─────────────────────────────────────────────────────────────────────
  # Add Flatpak directories to XDG_DATA_DIRS so Rofi can find Flatpak apps
  home.sessionVariables.XDG_DATA_DIRS = 
    "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS";

# ── Cursor ──────────────────────────────────────────────────────────────────
  # Sets the cursor system-wide for both Wayland and GTK applications
  home.pointerCursor = {
    gtk.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Classic";
    size       = 24;
  };
}
