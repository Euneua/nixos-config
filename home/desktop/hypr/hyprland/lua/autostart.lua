-- autostart.lua
-- Applications and daemons launched once on session start.

hl.on("hyprland.start", function()
  -- ── System ────────────────────────────────────────────────────────────────
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- ── Notifications ─────────────────────────────────────────────────────────
  hl.exec_cmd("swaync")

  -- ── Clipboard ─────────────────────────────────────────────────────────────
  hl.exec_cmd("wl-paste --type text  --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- ── Cursor ────────────────────────────────────────────────────────────────
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")

  -- ── Tray ──────────────────────────────────────────────────────────────────
  hl.exec_cmd("nm-applet --indicator")

  -- ── Lock ──────────────────────────────────────────────────────────────────
  hl.exec_cmd("hyprlock")

  -- ── Status Bar ────────────────────────────────────────────────────────────────
  hl.exec_cmd("waybar")
end)
