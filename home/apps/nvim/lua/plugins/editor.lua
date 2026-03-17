-- home/apps/nvim/lua/plugins/editor.lua
-- Editor behaviour: brackets, comments, indent guides, habit enforcer, formatter.

-- ── Auto Brackets ─────────────────────────────────────────────────────────────
require("nvim-autopairs").setup({})

-- ── Comments ──────────────────────────────────────────────────────────────────
require("Comment").setup({})

-- ── Indent Guides ─────────────────────────────────────────────────────────────
require("ibl").setup({})

-- ── Vim Habit Enforcer ────────────────────────────────────────────────────────
require("hardtime").setup({ enabled = true })

-- ── Formatter ─────────────────────────────────────────────────────────────────
require("conform").setup({
  formatters_by_ft = {
    nix    = { "nixfmt" },
    python = { "black" },
  },
})