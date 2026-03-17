-- home/apps/nvim/lua/plugins/git.lua
-- Git integration: sign column indicators and LazyGit TUI.
-- <leader>gg: open LazyGit

-- ── Sign Column Indicators ────────────────────────────────────────────────────
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