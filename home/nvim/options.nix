# nvim/options.nix
# Neovim editor options and global settings.
# Leader key is Space, used for all custom keybindings (see keymaps.nix).

{ config, pkgs, ... }:
{
  programs.nixvim.globals = {
    mapleader      = " ";
    maplocalleader = " ";
  };

  programs.nixvim.opts = {
    # ── Line Numbers ────────────────────────────────────────────────────────────
    # Absolute + relative numbers – useful for jumps like 5j or 3k
    number         = true;
    relativenumber = true;

    # ── Indentation ─────────────────────────────────────────────────────────────
    # Tab = 2 spaces, expandtab replaces tab characters with spaces
    tabstop    = 2;
    shiftwidth = 2;
    expandtab  = true;
    autoindent = true;

    # ── Search ──────────────────────────────────────────────────────────────────
    # Case insensitive unless the search term contains uppercase letters
    ignorecase = true;
    smartcase  = true;

    # ── Appearance ──────────────────────────────────────────────────────────────
    termguicolors = true;   # Enable 24-bit RGB colors
    cursorline    = true;   # Highlight the current line
    signcolumn    = "yes";  # Always show the sign column (prevents layout shifts)

    # ── Layout ──────────────────────────────────────────────────────────────────
    wrap       = false; # Disable line wrapping
    scrolloff  = 8;     # Keep 8 lines visible above/below cursor when scrolling
    splitbelow = true;  # Open horizontal splits below the current window
    splitright = true;  # Open vertical splits to the right of the current window

    # ── Persistence ─────────────────────────────────────────────────────────────
    undofile = true; # Persist undo history across sessions

    # ── Clipboard ───────────────────────────────────────────────────────────────
    clipboard = "unnamedplus"; # Share clipboard between Neovim and the system

    # ── Mouse ───────────────────────────────────────────────────────────────────
    mouse = ""; # Disable mouse completely – keyboard-driven workflow
  };
}
