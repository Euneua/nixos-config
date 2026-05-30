-- home/apps/nvim/lua/keymaps.lua
-- Key mappings. Leader key is set in options.lua.

local map = vim.keymap.set

-- ── File ──────────────────────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>",  { desc = "save" })
map("n", "<leader>q", "<cmd>q<cr>",  { desc = "quit" })

-- ── Oil (File Manager) ────────────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Oil<cr>",   { desc = "open file manager" })
map("n", "<leader>E", "<cmd>Oil .<cr>", { desc = "open file manager (root)" })

-- ── Harpoon ───────────────────────────────────────────────────────────────────
map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "harpoon add" })
map("n", "<leader>h", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "harpoon menu" })
map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "harpoon file 1" })
map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "harpoon file 2" })
map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "harpoon file 3" })
map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "harpoon file 4" })

-- ── Flash (Navigation) ────────────────────────────────────────────────────────
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "flash jump" })
map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "flash treesitter" })
map("o", "r", function()
  require("flash").remote()
end, { desc = "flash remote" })
map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "flash treesitter search" })

-- ── Telescope ─────────────────────────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "help tags" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>",        { desc = "todo comments" })

-- ── LSP ───────────────────────────────────────────────────────────────────────
map("n", "gd", vim.lsp.buf.definition,  { desc = "go to definition" })
map("n", "gr", vim.lsp.buf.references,  { desc = "references" })
map("n", "K",  vim.lsp.buf.hover,       { desc = "hover docs" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
map("n", "<leader>rn", vim.lsp.buf.rename,      { desc = "rename symbol" })

-- ── Trouble (Diagnostics) ─────────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              { desc = "diagnostics" })
map("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>",                  { desc = "symbols" })
map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>",           { desc = "lsp references" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   { desc = "quickfix" })

-- ── Formatting ────────────────────────────────────────────────────────────────
map("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "format buffer" })

-- ── Buffers ───────────────────────────────────────────────────────────────────
map("n", "<leader>bd", "<cmd>bd<cr>",   { desc = "close buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "next buffer" })
map("n", "<S-h>", "<cmd>bprev<cr>",     { desc = "prev buffer" })

-- ── Splits ────────────────────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>",  { desc = "horizontal split" })

-- ── Centered Navigation ───────────────────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz",  { desc = "scroll down centered" })
map("n", "<C-u>", "<C-u>zz",  { desc = "scroll up centered" })
map("n", "n",     "nzzzv",    { desc = "next search centered" })
map("n", "N",     "Nzzzv",    { desc = "prev search centered" })
map("n", "G",     "Gzz",      { desc = "goto last line centered" })

-- ── Visual Mode ───────────────────────────────────────────────────────────────
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })
