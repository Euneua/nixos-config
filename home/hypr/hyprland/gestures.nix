# hyprland/gestures.nix
# Touchpad gesture bindings for Hyprland.
# Uses 3-finger gestures for workspace navigation and window management.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    gesture = [
      "3, horizontal, workspace" # 3-finger swipe left/right – switch workspace
      "3, up, fullscreen"        # 3-finger swipe up – toggle fullscreen
      "3, down, close"           # 3-finger swipe down – close active window
    ];
  };
}
