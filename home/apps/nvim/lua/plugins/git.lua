-- home/apps/nvim/lua/plugins/git.lua
-- Git integration: sign column indicators and LazyGit TUI.
-- <leader>gg: LazyGit | <leader>gp: preview hunk | <leader>gs: stage | <leader>gr: reset | ]g/[g: next/prev hunk

-- ── Gitsigns ──────────────────────────────────────────────────────────────────
require("gitsigns").setup({
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "󰍵" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "│" },
  },
  current_line_blame = true,  -- Show git blame inline on current line
  current_line_blame_opts = {
    delay = 500,
    virt_text_pos = "eol",
  },
})
