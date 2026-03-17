-- home/apps/nvim/lua/plugins/ui.lua
-- UI plugins: theme, statusline, bufferline, keybind hints, notifications, file tree.

-- ── Theme ─────────────────────────────────────────────────────────────────────
require("catppuccin").setup({ flavour = "mocha" })
vim.cmd.colorscheme("catppuccin")

-- ── Statusline ────────────────────────────────────────────────────────────────
require("lualine").setup({
  options = { theme = "catppuccin" },
})

-- ── Bufferline ────────────────────────────────────────────────────────────────
require("bufferline").setup({})

-- ── Keybind Hints ─────────────────────────────────────────────────────────────
require("which-key").setup({})

-- ── Notifications ─────────────────────────────────────────────────────────────
local notify = require("notify")
notify.setup({})
vim.notify = notify

-- ── Command Line UI ───────────────────────────────────────────────────────────
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"]                = true,
      ["cmp.entry.get_documentation"]                  = true,
    },
  },
  presets = {
    bottom_search         = true,
    command_palette       = true,
    long_message_to_split = true,
  },
})

-- ── File Tree ─────────────────────────────────────────────────────────────────
require("neo-tree").setup({
  window = { width = 30 },
  filesystem = {
    filtered_items = {
      visible       = true,
      hide_hidden   = false,
      hide_dotfiles = false,
    },
  },
})