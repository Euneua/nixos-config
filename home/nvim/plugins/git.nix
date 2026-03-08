# nvim/plugins/git.nix
# Git integration plugins for Neovim.
# Gitsigns shows changes in the sign column, LazyGit provides a full Git TUI.

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    # ── Sign Column Indicators ───────────────────────────────────────────────────
    # Shows git diff status in the sign column (left side of the editor)
    # │ added  │ changed  󰍵 deleted  ‾ top of deleted block  ~ changed+deleted  │ untracked
    gitsigns = {
      enable = true;
      settings.signs = {
        add          = { text = "│"; };
        change       = { text = "│"; };
        delete       = { text = "󰍵"; };
        topdelete    = { text = "‾"; };
        changedelete = { text = "~"; };
        untracked    = { text = "│"; };
      };
    };

    # ── Git TUI ─────────────────────────────────────────────────────────────────
    # Full Git interface inside Neovim – commits, branches, diffs and staging
    # Open with <leader>gg (see keymaps.nix)
    lazygit.enable = true;
  };
}
