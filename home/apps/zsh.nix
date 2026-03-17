# home/apps/zsh.nix
# Zsh shell configuration with autosuggestions, syntax highlighting and Starship prompt.
# Starship prompt is generated from colors.nix to stay in sync with the theme.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  programs.zsh = {
    enable = true;

    # ── History ───────────────────────────────────────────────────────────────
    history = {
      size       = 10000;
      save       = 10000;
      ignoreDups = true;  # Don't save duplicate commands
      share      = true;  # Share history across terminals
    };

    # ── Plugins ───────────────────────────────────────────────────────────────
    autosuggestion.enable     = true;  # Fish-like autosuggestions from history
    syntaxHighlighting.enable = true;  # Highlight valid/invalid commands

    # ── Aliases ───────────────────────────────────────────────────────────────
    shellAliases = {
      # Navigation
      ".."  = "cd ..";
      "..." = "cd ../..";

      # Nix
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      cleanup = "sudo nix-collect-garbage -d";

      # Git
      g   = "git";
      ga  = "git add -A";
      gc  = "git commit -m";
      gp  = "git push";
      gs  = "git status";
      glo = "git log --oneline --graph";

      # Utils
      ls = "ls --color=auto";
      ll = "ls -la --color=auto";
    };

    # ── Extra Config ──────────────────────────────────────────────────────────
    initContent = ''
      # Must be set before syntax highlighting loads
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

      # Accept autosuggestion with right arrow
      bindkey '^[[C' autosuggest-accept

      # Cargo binaries
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
  };

  # ── Starship Prompt ───────────────────────────────────────────────────────
  # Generated from colors.nix – do not edit ~/.config/starship.toml manually.
  programs.starship.enable = true;

  home.file.".config/starship.toml".text = ''
    # starship.toml – auto-generated from colors.nix, do not edit manually

    add_newline = false
    format      = "$directory$git_branch$git_status$nix_shell$cmd_duration$line_break$character"

    # ── Directory ─────────────────────────────────────────────────────────────
    [directory]
    style             = "bold #${colors.blue}"
    truncation_length = 3
    truncate_to_repo  = true

    # ── Git ───────────────────────────────────────────────────────────────────
    [git_branch]
    format = "[$symbol$branch]($style) "
    symbol = " "
    style  = "bold #${colors.mauve}"

    [git_status]
    format = "([$all_status$ahead_behind]($style)) "
    style  = "bold #${colors.red}"

    # ── Nix Shell ─────────────────────────────────────────────────────────────
    [nix_shell]
    format = "[$symbol]($style) "
    symbol = " "
    style  = "bold #${colors.blue}"

    # ── Command Duration ──────────────────────────────────────────────────────
    [cmd_duration]
    format   = "[ $duration]($style) "
    style    = "bold #${colors.yellow}"
    min_time = 2000

    # ── Prompt Character ──────────────────────────────────────────────────────
    [character]
    success_symbol = "[❯](bold #${colors.green})"
    error_symbol   = "[❯](bold #${colors.red})"
  '';
}