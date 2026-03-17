# home/desktop/hypr/hyprland/master.nix
# Master tiling layout configuration.
# In master layout, one window is the master and the rest are slaves stacked beside it.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    master = {
      new_status     = "slave";  # New windows open as slaves, not as master
      new_on_top     = false;    # New slave windows appear at the bottom of the stack
      mfact          = 0.55;     # Master window takes 55% of the screen width
      orientation    = "left";   # Master window is on the left side
      smart_resizing = true;     # Resize both sides of a split proportionally
      drop_at_cursor = true;     # Drag and drop windows at cursor position
    };
  };
}