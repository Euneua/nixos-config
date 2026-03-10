-- Entry point – loaded at runtime from ~/.config/nvim/init.lua
-- Edit any file here and changes take effect immediately without rebuild.
local config = vim.fn.stdpath("config")

dofile(config .. "/options.lua")
dofile(config .. "/keymaps.lua")
dofile(config .. "/plugins/ui.lua")
dofile(config .. "/plugins/editor.lua")
dofile(config .. "/plugins/telescope.lua")
dofile(config .. "/plugins/git.lua")
dofile(config .. "/plugins/lsp.lua")
dofile(config .. "/plugins/cmp.lua")
