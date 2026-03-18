-- home/apps/nvim/lua/plugins/navigation.lua
-- Navigation: flash jump, harpoon file switching, oil file manager.

-- ── Flash (Jump Navigation) ───────────────────────────────────────────────────
-- s: jump anywhere | S: treesitter jump | r: remote (operator pending)
require("flash").setup({
  modes = {
    search = {
      enabled = true,  -- Flash labels appear during / search
    },
    char = {
      enabled = true,  -- Enhanced f/t/F/T with labels on repeat
    },
  },
})

-- ── Harpoon (File Switching) ──────────────────────────────────────────────────
-- <leader>a: add file | <leader>h: menu | <leader>1-4: jump to file
local harpoon = require("harpoon")
harpoon:setup({
  settings = {
    save_on_toggle = true,   -- Save list when toggling menu
    sync_on_ui_close = true, -- Sync to disk when menu closes
  },
})

-- ── Oil (File Manager) ────────────────────────────────────────────────────────
-- <leader>e: open current dir | <leader>E: open root
-- In oil: Enter: open | -: go up | g?: help
require("oil").setup({
  default_file_explorer = true,  -- Replace netrw
  delete_to_trash       = true,
  view_options = {
    show_hidden = true,  -- Show dotfiles
  },
  float = {
    padding     = 2,
    max_width   = 80,
    max_height  = 30,
    border      = "rounded",
  },
  keymaps = {
    ["g?"]   = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["-"]    = "actions.parent",
    ["_"]    = "actions.open_cwd",
    ["gs"]   = "actions.change_sort",
    ["gx"]   = "actions.open_external",
    ["g."]   = "actions.toggle_hidden",
  },
})
