-- rules/window-rules.lua

-- ── General ───────────────────────────────────────────────────────────────────
hl.window_rule({
  name           = "suppress-maximize",
  match          = { class = ".*" },
  suppress_event = "maximize", -- Hyprland manages layout, not apps
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

-- ── App-specific ──────────────────────────────────────────────────────────────
hl.window_rule({
  name  = "float-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name   = "center-jetbrains-toolbox",
  match  = { class = "jetbrains-toolbox" },
  float  = true,
  center = true,
})

-- ── Templates ─────────────────────────────────────────────────────────────────
-- hl.window_rule({
--   name    = "float-pavucontrol",
--   match   = { class = "^pavucontrol$" },
--   float   = true,
--   center  = true,
--   size    = "800 600",
-- })
--
-- hl.window_rule({
--   name    = "opacity-discord",
--   match   = { class = "^discord$" },
--   opacity = 0.95,
-- })
