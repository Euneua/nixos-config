-- rules/layer-rules.lua

-- ── Waybar ────────────────────────────────────────────────────────────────────
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 1 })

-- ── SwayNC ────────────────────────────────────────────────────────────────────
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 1 })
hl.layer_rule({ match = { namespace = "swaync-notification-center" }, blur = true, ignore_alpha = 1 })

-- ── Hyprlock ──────────────────────────────────────────────────────────────────
hl.layer_rule({ match = { namespace = "hyprlock" }, blur = true })

-- ── Rofi ──────────────────────────────────────────────────────────────────────
-- hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 1 })
