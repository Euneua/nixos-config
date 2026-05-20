-- binds/windows.lua

local mod = "SUPER"

-- ── Close ─────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- ── Fullscreen ────────────────────────────────────────────────────────────────
hl.bind(mod .. " + F",          hl.dsp.window.fullscreen({ mode = 0 })) -- True fullscreen
hl.bind(mod .. " + SHIFT + F",  hl.dsp.window.fullscreen({ mode = 1 })) -- Maximize (keep gaps)

-- ── Float ─────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())

-- ── Focus (hjkl) ──────────────────────────────────────────────────────────────
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left"  }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up"    }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down"  }))

-- ── Move (hjkl) ───────────────────────────────────────────────────────────────
hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- ── Mouse ─────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- LMB drag
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- RMB resize
