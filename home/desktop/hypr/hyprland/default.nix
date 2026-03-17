# home/desktop/hypr/hyprland/default.nix
# Entry point for the Hyprland window manager configuration.
# Imports all sub-modules to keep each concern in its own file.

{ config, pkgs, ... }:
{
  imports = [
    ./keybinds.nix     # Keybindings and mouse binds
    ./monitors.nix     # Monitor layout and scaling
    ./input.nix        # Keyboard, mouse and touchpad settings
    ./autostart.nix    # Applications launched on session start
    ./env.nix          # Environment variables for the Hyprland session
    ./variables.nix    # Hyprland general variables (gaps, borders, animations)
    ./workspaces.nix   # Workspace definitions and persistent rules
    ./dwindle.nix      # Dwindle tiling layout settings
    ./master.nix       # Master tiling layout settings
    ./misc.nix         # Miscellaneous Hyprland options
    ./gestures.nix     # Touchpad gesture bindings
    ./window-rules.nix # Per-application window rules (float, size, opacity)
    ./layer-rules.nix  # Layer surface rules (e.g. blur for Waybar, Rofi)
    ./xwayland.nix     # XWayland compatibility settings
  ];

  wayland.windowManager.hyprland.enable = true;
}