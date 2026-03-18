-- home/apps/nvim/lua/plugins/ui.lua
-- UI plugins: theme, statusline, icons, keybind hints.

-- ── Theme ─────────────────────────────────────────────────────────────────────
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
	integrations = {
		blink_cmp = true,
		flash = true,
		gitsigns = true,
		harpoon = true,
		indent_blankline = { enabled = true },
		lsp_trouble = true,
		telescope = { enabled = true },
		treesitter = true,
		which_key = true,
	},
})
vim.cmd.colorscheme("catppuccin")

-- ── Icons ─────────────────────────────────────────────────────────────────────
require("mini.icons").setup()

-- ── Statusline ────────────────────────────────────────────────────────────────
require("lualine").setup({
	options = {
		theme = "catppuccin",
		globalstatus = true,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } }, -- Relative path
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

-- ── Keybind Hints ─────────────────────────────────────────────────────────────
require("which-key").setup({
	delay = 300,
})
