# hyprland/layer-rules.nix
# Layer surface rules for Hyprland.
# Controls blur and transparency for overlay surfaces like Waybar, SwayNC and Hyprlock.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # ── Waybar ──────────────────────────────────────────────────────────────
      "blur on, match:namespace waybar"
      "ignore_alpha 1, match:namespace waybar"

      # ── SwayNC – notification window and center ──────────────────────────────
      "blur on, match:namespace swaync-notification-window"
      "ignore_alpha 1, match:namespace swaync-notification-window"
      "blur on, match:namespace swaync-notification-center"
      "ignore_alpha 1, match:namespace swaync-notification-center"

      # ── Rofi launcher (uncomment if blur is desired) ─────────────────────────
      #"blur on, match:namespace rofi"
      #"ignore_alpha 1, match:namespace rofi"

      # ── Hyprlock ────────────────────────────────────────────────────────────
      "blur on, match:namespace hyprlock"
    ];
  };
}
