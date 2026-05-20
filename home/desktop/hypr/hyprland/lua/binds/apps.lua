-- binds/apps.lua

local mod = "SUPER"

-- ── Terminal ──────────────────────────────────────────────────────────────────
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("ghostty"))

-- ── Launchers ─────────────────────────────────────────────────────────────────
hl.bind(mod .. " + Space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + Tab",   hl.dsp.exec_cmd("rofi -show window"))

-- ── Apps ──────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + E", hl.dsp.exec_cmd("ghostty -e yazi"))
hl.bind(mod .. " + G", hl.dsp.exec_cmd("ghostty -e lazygit"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))

-- ── Clipboard ─────────────────────────────────────────────────────────────────
hl.bind(mod .. " + V", hl.dsp.exec_cmd(
  "cliphist list | rofi -dmenu -p 'Clipboard' | cliphist decode | wl-copy"
))

-- ── Cheatsheet ────────────────────────────────────────────────────────────────
hl.bind(mod .. " + c",         hl.dsp.exec_cmd("cheatsheet"))
hl.bind(mod .. " + SHIFT + c", hl.dsp.exec_cmd("cheatsheet --category hyprland"))
hl.bind(mod .. " + CTRL + c",  hl.dsp.exec_cmd("cheatsheet --category neovim"))

-- ── Screenshots ───────────────────────────────────────────────────────────────
hl.bind("Print",           hl.dsp.exec_cmd("grimblast copy area"))   -- Select area
hl.bind("SHIFT + Print",   hl.dsp.exec_cmd("grimblast copy screen")) -- Full screen
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("grimblast copy active")) -- Active window
