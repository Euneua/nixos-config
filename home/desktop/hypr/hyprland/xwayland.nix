# home/desktop/hypr/hyprland/xwayland.nix
# XWayland compatibility settings.
# XWayland allows legacy X11 applications to run in the Wayland session.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    xwayland = {
      enabled              = true;   # Enable XWayland for X11 application support
      use_nearest_neighbor = false;  # Use linear filtering for scaled XWayland windows
      force_zero_scaling   = true;   # Disable XWayland scaling – let Hyprland handle it
    };
  };
}