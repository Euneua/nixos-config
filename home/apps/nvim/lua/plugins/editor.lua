-- home/apps/nvim/lua/plugins/editor.lua
-- Editor behaviour: brackets, indent guides, surround, todo comments, habit enforcer, formatter.

-- ── Auto Brackets ─────────────────────────────────────────────────────────────
require("nvim-autopairs").setup({})

-- ── Surround ──────────────────────────────────────────────────────────────────
-- ys<motion><char>: add | cs<old><new>: change | ds<char>: delete
require("nvim-surround").setup({})

-- ── Indent Guides ─────────────────────────────────────────────────────────────
require("ibl").setup({
  indent = { char = "│" },
  scope  = { enabled = true },
})

-- ── Todo Comments ─────────────────────────────────────────────────────────────
-- highlights TODO, FIXME, NOTE etc. – searchable via <leader>ft
require("todo-comments").setup({})

-- ── Vim Habit Enforcer ────────────────────────────────────────────────────────
-- nudges away from repeated hjkl and arrow keys after 3 repeats
require("hardtime").setup({
  enabled            = true,
  max_time           = 1000,
  max_count          = 3,
  disable_mouse      = false,
  hint               = true,
  notification       = true,
  allow_different_key = true,
  restriction_mode   = "hint",
  restricted_keys = {
    ["h"]       = { "n", "x" },
    ["j"]       = { "n", "x" },
    ["k"]       = { "n", "x" },
    ["l"]       = { "n", "x" },
    ["<Up>"]    = { "n", "x" },
    ["<Down>"]  = { "n", "x" },
    ["<Left>"]  = { "n", "x" },
    ["<Right>"] = { "n", "x" },
  },
  disabled_filetypes = {
    "qf", "netrw", "lazy", "mason",
    "oil", "help", "TelescopePrompt", "trouble",
  },
})

-- ── Formatter ─────────────────────────────────────────────────────────────────
require("conform").setup({
  formatters_by_ft = {
    nix        = { "nixfmt" },
    rust       = { "rustfmt" },
    python     = { "black" },
    lua        = { "stylua" },
    toml       = { "taplo" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    svelte     = { "prettier" },
    css        = { "prettier" },
    json       = { "prettier" },
    html       = { "prettier" },
    markdown   = { "prettier" },
  },
})
