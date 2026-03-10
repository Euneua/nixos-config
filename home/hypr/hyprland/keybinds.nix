# hyprland/keybinds.nix
# Keybindings for Hyprland.
# Modifier key: SUPER
# Window focus and movement use hjkl (Vim-style navigation).
# Workspaces 1-5 are on number keys, 6-10 on z,u,i,o,p.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      # ── Terminal & Apps ─────────────────────────────────────────────────────
      "$mod, Return, exec, ghostty"
      "$mod, Space,  exec, rofi -show drun"
      "$mod, V,      exec, cliphist list | rofi -dmenu -p 'Clipboard' | cliphist decode | wl-copy"
      "$mod, Tab,    exec, rofi -show window"
      "$mod, E,      exec, ghostty -e yazi"
      "$mod, B,      exec, firefox"
      # ── Cheatsheet ───────────────────────────────────────────────────────────────
      "$mod, c,       exec, cheatsheet"
      "$mod SHIFT, c, exec, cheatsheet --category hyprland"
      "$mod CTRL, c , exec, cheatsheet --category neovim"

      # ── Screenshot (grimblast) ───────────────────────────────────────────────
      ",      Print, exec, grimblast copy area"   # Select area
      "SHIFT,  Print, exec, grimblast copy screen" # Full screen
      "$mod,   Print, exec, grimblast copy active" # Active window

      # ── Window Management ───────────────────────────────────────────────────
      "$mod, Q,       killactive"
      "$mod, F,       fullscreen, 0"        # True fullscreen
      "$mod SHIFT, F, fullscreen, 1"        # Maximize (keep gaps)
      "$mod, T,       togglefloating"
      "$mod, P,       pseudo"               # Toggle pseudotile

      # ── Focus (hjkl) ────────────────────────────────────────────────────────
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # ── Move Windows (hjkl) ─────────────────────────────────────────────────
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"

      # ── Resize Windows (hjkl) ───────────────────────────────────────────────
      "$mod CTRL, h, resizeactive, -50 0"
      "$mod CTRL, l, resizeactive,  50 0"
      "$mod CTRL, k, resizeactive,   0 -50"
      "$mod CTRL, j, resizeactive,   0  50"

      # ── Workspaces 1–5 (number keys) ────────────────────────────────────────
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"

      # ── Workspaces 6–10 (z,u,i,o,p) ────────────────────────────────────────
      "$mod, z, workspace, 6"
      "$mod, u, workspace, 7"
      "$mod, i, workspace, 8"
      "$mod, o, workspace, 9"
      "$mod, p, workspace, 10"

      # ── Move Windows to Workspace 1–5 ───────────────────────────────────────
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"

      # ── Move Windows to Workspace 6–10 ──────────────────────────────────────
      "$mod SHIFT, z, movetoworkspace, 6"
      "$mod SHIFT, u, movetoworkspace, 7"
      "$mod SHIFT, i, movetoworkspace, 8"
      "$mod SHIFT, o, movetoworkspace, 9"
      "$mod SHIFT, p, movetoworkspace, 10"

      # ── Hyprland Session ────────────────────────────────────────────────────
      "$mod SHIFT, R, exec, hyprctl reload"
      "$mod SHIFT, E, exit, exit"
    ];

    # ── Media & Brightness (repeatable while held) ───────────────────────────
    bindel = [
      ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    # ── Media Playback (requires playerctl) ─────────────────────────────────
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
