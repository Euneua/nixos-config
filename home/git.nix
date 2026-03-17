# home/git.nix
# Git version control configuration.
# Uses GitHub noreply email to keep the real email address private.

{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      # ── Identity ──────────────────────────────────────────────────────────
      user.name  = "Euneua";
      user.email = "164413297+Euneua@users.noreply.github.com";  # GitHub noreply address

      # ── Defaults ──────────────────────────────────────────────────────────
      init.defaultBranch   = "main";
      pull.rebase          = true;   # Rebase instead of merge when pulling
      push.autoSetupRemote = true;   # Automatically set upstream on first push

      # ── Output ────────────────────────────────────────────────────────────
      core.pager = "cat";   # Print output directly to terminal instead of opening in less
      color.ui   = "auto";
    };
  };
}