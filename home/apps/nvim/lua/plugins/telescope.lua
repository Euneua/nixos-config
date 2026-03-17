-- home/apps/nvim/lua/plugins/telescope.lua
-- Telescope fuzzy finder.
-- <leader>ff: find files | <leader>fg: live grep | <leader>fb: buffers | <leader>fh: help tags

local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")