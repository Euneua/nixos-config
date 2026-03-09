-- ── Theme ─────────────────────────────────────────────────────────────────────
-- Must be set up first so other plugins can reference the catppuccin theme
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
-- Set up notify first so noice can use it as its notification backend
local notify = require("notify")
notify.setup({})
vim.notify = notify

-- ── Command Line UI ───────────────────────────────────────────────────────────
-- Replaces the default command line and messages with a cleaner floating UI
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"]                = true,
      ["cmp.entry.get_documentation"]                  = true,
    },
  },
  presets = {
    bottom_search      = true,
    command_palette    = true,
    long_message_to_split = true,
  },
})

-- ── File Tree ─────────────────────────────────────────────────────────────────
require("neo-tree").setup({
  window = { width = 30 },
  filesystem = {
    filtered_items = {
      visible       = true,   -- Show filtered items as dimmed instead of hiding them
      hide_hidden   = false,  -- Show hidden files
      hide_dotfiles = false,  -- Show dotfiles
    },
  },
})
