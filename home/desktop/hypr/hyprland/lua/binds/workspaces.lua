-- binds/workspaces.lua

local mod = "SUPER"

-- ── Switch workspaces 1–5 (number keys) ───────────────────────────────────────
for i = 1, 5 do
  hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- ── Switch workspaces 6–10 (z,u,i,o,p) ───────────────────────────────────────
local wsKeys = { "z", "u", "i", "o", "p" }
for idx, key in ipairs(wsKeys) do
  local ws = idx + 5
  hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = ws }))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
end

-- ── Scroll through workspaces ─────────────────────────────────────────────────
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- ── Scratchpads ───────────────────────────────────────────────────────────────
-- Note: verify key name with `wev` if not working (German layout)
hl.bind(mod .. " + asciicircum", hl.dsp.workspace.toggle_special("terminal"))
