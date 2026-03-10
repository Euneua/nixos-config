-- Leader key – must be set before any plugin loads
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- ── Line Numbers ──────────────────────────────────────────────────────────────
opt.number         = true
opt.relativenumber = true

-- ── Indentation ───────────────────────────────────────────────────────────────
opt.tabstop    = 2
opt.shiftwidth = 2
opt.expandtab  = true
opt.autoindent = true

-- ── Search ────────────────────────────────────────────────────────────────────
opt.ignorecase = true
opt.smartcase  = true

-- ── Appearance ────────────────────────────────────────────────────────────────
opt.termguicolors = true
opt.cursorline    = true
opt.signcolumn    = "yes"

-- ── Layout ────────────────────────────────────────────────────────────────────
opt.wrap       = false
opt.scrolloff  = 8
opt.splitbelow = true
opt.splitright = true

-- ── Persistence ───────────────────────────────────────────────────────────────
opt.undofile = true

-- ── Clipboard ─────────────────────────────────────────────────────────────────
opt.clipboard = "unnamedplus"

-- ── Mouse ─────────────────────────────────────────────────────────────────────
opt.mouse = ""