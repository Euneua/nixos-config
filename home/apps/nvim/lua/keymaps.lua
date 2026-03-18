-- home/apps/nvim/lua/keymaps.lua
-- Key mappings. Leader key is set in options.lua.

local map = vim.keymap.set

-- ── File ──────────────────────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- ── Oil (File Manager) ────────────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open File Manager" })
map("n", "<leader>E", "<cmd>Oil .<cr>", { desc = "Open File Manager (root)" })

-- ── Harpoon ───────────────────────────────────────────────────────────────────
map("n", "<leader>a", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add" })
map("n", "<leader>h", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon Menu" })
map("n", "<leader>1", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon File 1" })
map("n", "<leader>2", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon File 2" })
map("n", "<leader>3", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon File 3" })
map("n", "<leader>4", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon File 4" })

-- ── Flash (Navigation) ────────────────────────────────────────────────────────
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Flash Remote" })
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Flash Treesitter Search" })

-- ── Telescope ─────────────────────────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo Comments" })

-- ── LSP ───────────────────────────────────────────────────────────────────────
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Docs" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- ── Trouble (Diagnostics) ─────────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols" })
map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "LSP References" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })

-- ── Formatting ────────────────────────────────────────────────────────────────
map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format Buffer" })

-- ── Git ───────────────────────────────────────────────────────────────────────
map("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview Hunk" })
map("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage Hunk" })
map("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset Hunk" })
map("n", "]g", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Hunk" })
map("n", "[g", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk" })

-- ── Buffers ───────────────────────────────────────────────────────────────────
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Prev Buffer" })

-- ── Splits ────────────────────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- ── Centered Navigation ───────────────────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Centered" })
map("n", "n", "nzzzv", { desc = "Next Search Centered" })
map("n", "N", "Nzzzv", { desc = "Prev Search Centered" })
map("n", "G", "Gzz", { desc = "Goto Last Line Centered" })

-- ── Visual Mode ───────────────────────────────────────────────────────────────
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })
