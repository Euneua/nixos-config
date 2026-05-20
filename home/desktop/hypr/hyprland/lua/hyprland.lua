-- hyprland.lua
-- Entry point – require() calls only, no logic here.
-- Each file is a separate scope: errors in one don't stop others.

-- ── Core ──────────────────────────────────────────────────────────────────────
require("colors")   -- Loaded first, used by all other modules

-- ── System ────────────────────────────────────────────────────────────────────
require("env")
require("monitors")
require("autostart")
require("misc")
require("xwayland")
require("permissions")
require("scripts")

-- ── Appearance ────────────────────────────────────────────────────────────────
require("appearance/general")
require("appearance/decoration")
require("appearance/animations")

-- ── Input ─────────────────────────────────────────────────────────────────────
require("input/keyboard")
require("input/mouse")
require("input/touchpad")
require("input/gestures")
require("input/devices")

-- ── Layouts ───────────────────────────────────────────────────────────────────
require("layouts/dwindle")
require("layouts/master")
require("layouts/scrolling")

-- ── Binds ─────────────────────────────────────────────────────────────────────
require("binds/apps")
require("binds/windows")
require("binds/workspaces")
require("binds/media")
require("binds/submaps")

-- ── Rules ─────────────────────────────────────────────────────────────────────
require("rules/window-rules")
require("rules/layer-rules")
require("rules/workspace-rules")
require("rules/scratchpads")
