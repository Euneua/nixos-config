-- Leader key – must be set before any plugin loads
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- ── Line Numbers ──────────────────────────────────────────────────────────────
-- Absolute + relative numbers – useful for jumps like 5j or 3k
opt.number         = true
opt.relativenumber = true

-- ── Indentation ───────────────────────────────────────────────────────────────
-- Tab = 2 spaces, expandtab replaces tab characters with spaces
opt.tabstop    = 2
opt.shiftwidth = 2
opt.expandtab  = true
opt.autoindent = true

-- ── Search ────────────────────────────────────────────────────────────────────
-- Case insensitive unless the search term contains uppercase letters
opt.ignorecase = true
opt.smartcase  = true

-- ── Appearance ────────────────────────────────────────────────────────────────
opt.termguicolors = true   -- Enable 24-bit RGB colors
opt.cursorline    = true   -- Highlight the current line
opt.signcolumn    = "yes"  -- Always show the sign column (prevents layout shifts)

-- ── Layout ────────────────────────────────────────────────────────────────────
opt.wrap       = false  -- Disable line wrapping
opt.scrolloff  = 8      -- Keep 8 lines visible above/below cursor when scrolling
opt.splitbelow = true   -- Open horizontal splits below the current window
opt.splitright = true   -- Open vertical splits to the right of the current window

-- ── Persistence ───────────────────────────────────────────────────────────────
opt.undofile = true  -- Persist undo history across sessions

-- ── Clipboard ─────────────────────────────────────────────────────────────────
opt.clipboard = "unnamedplus"  -- Share clipboard between Neovim and the system

-- ── Mouse ─────────────────────────────────────────────────────────────────────
opt.mouse = ""  -- Disable mouse completely – keyboard-driven workflow
