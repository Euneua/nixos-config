# hyprland/monitors.nix
# Monitor layout and scaling configuration.
# Custom modeline for the internal WQHD 2560x1600 (16:10) display at 1.6x fractional scaling.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # eDP-1: internal display – custom modeline required for correct refresh rate
      # Resolution: 2560x1600, fractional scaling: 1.6, position: auto
      "eDP-1, modeline 348.16 2560 2752 3032 3504 1600 1601 1604 1656 -HSync +Vsync, auto, 1.6"
    ];
  };
}
