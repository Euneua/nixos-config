-- ── Sign Column Indicators ────────────────────────────────────────────────────
-- Shows git diff status in the sign column (left side of the editor)
require("gitsigns").setup({
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "󰍵" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "│" },
  },
})
