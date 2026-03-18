-- home/apps/nvim/lua/plugins/telescope.lua
-- Telescope fuzzy finder.
-- <leader>ff: find files | <leader>fg: live grep | <leader>fb: buffers | <leader>fh: help tags | <leader>ft: todos

local telescope = require("telescope")
local actions   = require("telescope.actions")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config    = {
      prompt_position = "top",
      width           = 0.85,
      height          = 0.85,
      preview_width   = 0.55,
    },
    mappings = {
      i = {
        ["<C-k>"]    = actions.move_selection_previous,
        ["<C-j>"]    = actions.move_selection_next,
        ["<C-q>"]    = actions.send_selected_to_qflist + actions.open_qflist,
        ["<Esc>"]    = actions.close,
      },
    },
    file_ignore_patterns = { "%.git/", "node_modules/", "target/" },
  },
  pickers = {
    find_files = {
      hidden = true,  -- Show dotfiles
    },
  },
})

telescope.load_extension("fzf")
