# hyprland/dwindle.nix
# Dwindle tiling layout configuration.
# Dwindle splits windows alternately horizontally and vertically.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile     = true;  # Allows windows to be pseudo-tiled (toggleable with a keybind)
      preserve_split = true;  # Keep the split direction when a window is closed
      smart_split    = false; # Disable splitting based on cursor position
      smart_resizing = true;  # Resize both sides of a split proportionally
      force_split    = 2;     # Always split downward for consistent keyboard-driven workflow
    };
  };
}
