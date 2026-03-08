# nvim/keymaps.nix
# Neovim keybindings.
# Leader key is set to Space (see options.nix).

{ config, pkgs, ... }:
{
  programs.nixvim.keymaps = [
    # ── File ────────────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>w"; action = "<cmd>w<cr>"; options.desc = "Save"; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>q<cr>"; options.desc = "Quit"; }

    # ── File Tree ───────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>e"; action = "<cmd>Neotree toggle<cr>"; options.desc = "Toggle File Tree"; }

    # ── Telescope ───────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.desc = "Find Files"; }
    { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>";  options.desc = "Live Grep"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>";    options.desc = "Buffers"; }
    { mode = "n"; key = "<leader>fh"; action = "<cmd>Telescope help_tags<cr>";  options.desc = "Help Tags"; }

    # ── LSP ─────────────────────────────────────────────────────────────────────
    { mode = "n"; key = "gd";         action = "<cmd>lua vim.lsp.buf.definition()<cr>";  options.desc = "Go to Definition"; }
    { mode = "n"; key = "gr";         action = "<cmd>lua vim.lsp.buf.references()<cr>";  options.desc = "References"; }
    { mode = "n"; key = "K";          action = "<cmd>lua vim.lsp.buf.hover()<cr>";       options.desc = "Hover Docs"; }
    { mode = "n"; key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; options.desc = "Code Action"; }
    { mode = "n"; key = "<leader>rn"; action = "<cmd>lua vim.lsp.buf.rename()<cr>";      options.desc = "Rename Symbol"; }

    # ── Formatting ──────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>cf"; action = "<cmd>lua require('conform').format()<cr>"; options.desc = "Format Buffer"; }

    # ── Git ─────────────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>gg"; action = "<cmd>LazyGit<cr>"; options.desc = "LazyGit"; }

    # ── Buffers ─────────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>bd"; action = "<cmd>bd<cr>";    options.desc = "Close Buffer"; }
    { mode = "n"; key = "<S-l>";      action = "<cmd>bnext<cr>"; options.desc = "Next Buffer"; }
    { mode = "n"; key = "<S-h>";      action = "<cmd>bprev<cr>"; options.desc = "Prev Buffer"; }

    # ── Splits ──────────────────────────────────────────────────────────────────
    { mode = "n"; key = "<leader>sv"; action = "<cmd>vsplit<cr>"; options.desc = "Vertical Split"; }
    { mode = "n"; key = "<leader>sh"; action = "<cmd>split<cr>";  options.desc = "Horizontal Split"; }

    # ── Centered Navigation ──────────────────────────────────────────────────────
    # Keeps the cursor vertically centered while scrolling and searching
    { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; options.desc = "Scroll Down Centered"; }
    { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; options.desc = "Scroll Up Centered"; }
    { mode = "n"; key = "n";     action = "nzzzv";   options.desc = "Next Search Centered"; }
    { mode = "n"; key = "N";     action = "Nzzzv";   options.desc = "Prev Search Centered"; }
    { mode = "n"; key = "G";     action = "Gzz";     options.desc = "Goto Last Line Centered"; }

    # ── Visual Mode ─────────────────────────────────────────────────────────────
    # Move selected lines up and down while keeping indentation
    { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; options.desc = "Move Line Down"; }
    { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; options.desc = "Move Line Up"; }
  ];
}
