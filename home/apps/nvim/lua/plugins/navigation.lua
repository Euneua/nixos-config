-- home/apps/nvim/lua/plugins/navigation.lua
-- Navigation: flash jump, harpoon file switching, oil file manager.

-- ── Flash (Jump Navigation) ───────────────────────────────────────────────────
-- s: jump | S: treesitter jump | r: remote (operator pending)
require("flash").setup({
  modes = {
    search = { enabled = true },
    char   = { enabled = true },
  },
})

-- ── Harpoon (File Switching) ──────────────────────────────────────────────────
-- <leader>a: add | <leader>h: menu | <leader>1-4: jump to file
local harpoon = require("harpoon")
harpoon:setup({
  settings = {
    save_on_toggle   = true,
    sync_on_ui_close = true,
  },
})

-- ── Oil (File Manager) ────────────────────────────────────────────────────────
-- <leader>e: open current dir | <leader>E: open root
-- in oil: Enter: open | -: go up | g?: help
require("oil").setup({
  default_file_explorer = true,
  delete_to_trash       = true,
  view_options = {
    show_hidden = true,
  },
  float = {
    padding    = 2,
    max_width  = 80,
    max_height = 30,
    border     = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  use_default_keymaps = false,
  keymaps = {
    ["g?"]    = "actions.show_help",
    ["<CR>"]  = "actions.select",
    ["-"]     = "actions.parent",
    ["_"]     = "actions.open_cwd",
    ["gs"]    = "actions.change_sort",
    ["gx"]    = "actions.open_external",
    ["g."]    = "actions.toggle_hidden",
    ["gp"]    = "actions.preview",
    ["<C-c>"] = "actions.close",
  },
})
