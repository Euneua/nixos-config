-- home/apps/nvim/lua/options.lua
-- Core Neovim options.

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
opt.breakindent = true

-- ── Search ────────────────────────────────────────────────────────────────────
opt.ignorecase = true
opt.smartcase  = true

-- ── Appearance ────────────────────────────────────────────────────────────────
opt.termguicolors = true
opt.cursorline    = true
opt.signcolumn    = "yes"
opt.pumheight     = 10

-- ── Conceal (required for render-markdown and obsidian) ───────────────────────
opt.conceallevel  = 2
opt.concealcursor = "nc"

-- ── Layout ────────────────────────────────────────────────────────────────────
opt.wrap       = false
opt.scrolloff  = 8
opt.splitbelow = true
opt.splitright = true

-- ── Performance ───────────────────────────────────────────────────────────────
opt.updatetime  = 250
opt.timeoutlen  = 300

-- ── Persistence ───────────────────────────────────────────────────────────────
opt.undofile = true

-- ── Clipboard ─────────────────────────────────────────────────────────────────
opt.clipboard = "unnamedplus"

-- ── Mouse ─────────────────────────────────────────────────────────────────────
opt.mouse = ""
