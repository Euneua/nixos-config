# home/desktop/hypr/hyprland/autostart.nix
# Autostart configuration for Hyprland.
# These commands run once when the Hyprland session starts.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Polkit authentication agent – handles sudo popups in GUI applications
      "systemctl --user start hyprpolkitagent"

      # Wallpaper – swww daemon must start before setting the image
      "swww-daemon"
      "swww img ~/Pictures/wallpapers/wallpaper.jpg --transition-type fade --transition-duration 1"

      # Notification daemon
      "swaync"

      # Clipboard manager – watches for text and image entries separately
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      # Cursor theme (must match GTK cursor settings)
      "hyprctl setcursor Bibata-Modern-Classic 24"

      # Network manager tray applet – used for the Waybar network module click action
      "nm-applet --indicator"

      # Lock the screen immediately on session start
      "hyprlock"
    ];
  };
}