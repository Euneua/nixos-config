# nvim/plugins/ui.nix
# User interface plugins for Neovim.
# Covers statusline, bufferline, file tree, notifications and keybind hints.

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    # ── Bars ────────────────────────────────────────────────────────────────────
    # Status bar at the bottom – shows mode, filename, git branch and LSP status
    lualine.enable = true;
    # Open buffers displayed as tabs at the top of the screen
    bufferline.enable = true;

    # ── Keybind Hints ───────────────────────────────────────────────────────────
    # Shows available keybindings in a popup when pressing <leader>
    which-key.enable = true;

    # ── Command Line & Notifications ─────────────────────────────────────────────
    # Replaces the default command line and messages with a cleaner floating UI
    noice.enable = true;
    # Better notification popups – used as the notification backend for noice
    notify.enable = true;

    # ── Icons ───────────────────────────────────────────────────────────────────
    # File type icons used by neo-tree, bufferline, telescope and others
    web-devicons.enable = true;

    # ── File Tree ───────────────────────────────────────────────────────────────
    # Sidebar file explorer – toggle with <leader>e (see keymaps.nix)
    neo-tree = {
      enable = true;
      settings = {
        window.width = 30; # Sidebar width in columns
        filesystem.filtered_items = {
          visible       = true;  # Show filtered items as dimmed instead of hiding them
          hide_hidden   = false; # Show hidden files
          hide_dotfiles = false; # Show dotfiles
        };
      };
    };
  };
}
