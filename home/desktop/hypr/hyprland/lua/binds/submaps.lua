-- binds/submaps.lua

local mod = "SUPER"

-- ── Resize submap ─────────────────────────────────────────────────────────────
-- Enter: SUPER+R → resize with hjkl → ESC to exit
hl.bind(mod .. " + R", function()
  hl.dispatch(hl.dsp.submap("resize"))
end)

hl.bind("h", hl.dsp.window.resize({ delta = { x = -50, y =   0 } }), { submap = "resize", repeating = true })
hl.bind("l", hl.dsp.window.resize({ delta = { x =  50, y =   0 } }), { submap = "resize", repeating = true })
hl.bind("k", hl.dsp.window.resize({ delta = { x =   0, y = -50 } }), { submap = "resize", repeating = true })
hl.bind("j", hl.dsp.window.resize({ delta = { x =   0, y =  50 } }), { submap = "resize", repeating = true })

hl.bind("escape", hl.dsp.submap("reset"), { submap = "resize" })
hl.bind("return", hl.dsp.submap("reset"), { submap = "resize" })

-- ── System submap ─────────────────────────────────────────────────────────────
-- Enter: SUPER+SHIFT+S → l=lock, e=exit, r=reload → ESC to cancel
hl.bind(mod .. " + SHIFT + S", function()
  hl.dispatch(hl.dsp.submap("system"))
end)

hl.bind("l", hl.dsp.exec_cmd("hyprlock"),       { submap = "system" }) -- Lock
hl.bind("e", hl.dsp.exit(),                      { submap = "system" }) -- Exit Hyprland
hl.bind("r", hl.dsp.exec_cmd("hyprctl reload"),  { submap = "system" }) -- Reload config

hl.bind("escape", hl.dsp.submap("reset"), { submap = "system" })
