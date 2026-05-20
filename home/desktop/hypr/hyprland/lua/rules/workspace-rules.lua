-- rules/workspace-rules.lua

hl.workspace_rule({
  workspace  = "1",
  persistent = true, -- Always exists, even when empty
  default    = true, -- Active on session start
})

-- ── Smart gaps – no gaps when only one window ──────────────────────────────────
hl.workspace_rule({ workspace = "w[tv1]", gaps_in = 0, gaps_out = { top = 4, right = 0, bottom = 0, left = 0 } })
hl.workspace_rule({ workspace = "f[1]",   gaps_in = 0, gaps_out = { top = 4, right = 0, bottom = 0, left = 0 } })
