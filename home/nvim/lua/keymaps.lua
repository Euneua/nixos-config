local map = vim.keymap.set

-- ── File ──────────────────────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>",  { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>",  { desc = "Quit" })

-- ── File Tree ─────────────────────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Tree" })

-- ── Telescope ─────────────────────────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help Tags" })

-- ── LSP ───────────────────────────────────────────────────────────────────────
map("n", "gd",         vim.lsp.buf.definition,  { desc = "Go to Definition" })
map("n", "gr",         vim.lsp.buf.references,  { desc = "References" })
map("n", "K",          vim.lsp.buf.hover,        { desc = "Hover Docs" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename,       { desc = "Rename Symbol" })

-- ── Formatting ────────────────────────────────────────────────────────────────
map("n", "<leader>cf", function() require("conform").format() end, { desc = "Format Buffer" })

-- ── Git ───────────────────────────────────────────────────────────────────────
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- ── Buffers ───────────────────────────────────────────────────────────────────
map("n", "<leader>bd", "<cmd>bd<cr>",    { desc = "Close Buffer" })
map("n", "<S-l>",      "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>",      "<cmd>bprev<cr>", { desc = "Prev Buffer" })

-- ── Splits ────────────────────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<leader>sh", "<cmd>split<cr>",  { desc = "Horizontal Split" })

-- ── Centered Navigation ───────────────────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Centered" })
map("n", "n",     "nzzzv",   { desc = "Next Search Centered" })
map("n", "N",     "Nzzzv",   { desc = "Prev Search Centered" })
map("n", "G",     "Gzz",     { desc = "Goto Last Line Centered" })

-- ── Visual Mode ───────────────────────────────────────────────────────────────
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })