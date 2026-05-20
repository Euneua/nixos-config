-- rules/scratchpads.lua
-- Hidden workspaces that can be toggled on/off from anywhere.
-- Bind them in binds/workspaces.lua

-- ── Terminal scratchpad ───────────────────────────────────────────────────────
hl.workspace_rule({
  workspace  = "special:terminal",
  on_created_empty = "ghostty",
})

-- ── More scratchpads ──────────────────────────────────────────────────────────
-- hl.workspace_rule({
--   workspace        = "special:music",
--   on_created_empty = "spotify",
-- })
