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
	scope = { enabled = true },
})

-- ── Todo Comments ─────────────────────────────────────────────────────────────
-- Highlights TODO, FIXME, NOTE etc. and makes them searchable via Telescope (<leader>ft)
require("todo-comments").setup({})

-- ── Vim Habit Enforcer ────────────────────────────────────────────────────────
require("hardtime").setup({ enabled = true })

-- ── Formatter ─────────────────────────────────────────────────────────────────
require("conform").setup({
	formatters_by_ft = {
		nix = { "nixfmt" },
		rust = { "rustfmt" },
		python = { "black" },
		lua = { "stylua" },
		toml = { "taplo" },
	},
})
