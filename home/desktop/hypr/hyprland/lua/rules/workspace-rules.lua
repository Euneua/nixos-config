-- rules/workspace-rules.lua

hl.workspace_rule({
  workspace  = "1",
  persistent = true, -- Always exists, even when empty
  default    = true, -- Active on session start
})

-- ── Smart gaps – no gaps when only one window ──────────────────────────────────
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
