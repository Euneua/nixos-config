# home/apps/zsh.nix
{ config, pkgs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;
in
{
  programs.zsh = {
    enable = true;
    history = {
      size       = 10000;
      save       = 10000;
      ignoreDups = true;
      share      = true;
    };
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".."  = "cd ..";
      "..." = "cd ../..";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#thinkbook";
      cleanup = "sudo nix-collect-garbage -d";
      g   = "git";
      ga  = "git add -A";
      gc  = "git commit -m";
      gp  = "git push";
      gs  = "git status";
      glo = "git log --oneline --graph";
      ls = "ls --color=auto";
      ll = "ls -la --color=auto";
      arduino = "NIXOS_OZONE_WL=0 arduino-ide";
    };
    initContent = ''
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
      bindkey '^[[C' autosuggest-accept
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
  };

  programs.starship.enable = true;
  home.file.".config/starship.toml".text = ''
    add_newline = false
    format      = "$directory$git_branch$git_status$nix_shell$cmd_duration$line_break$character"

    [directory]
    style             = "bold #${r.link}"
    truncation_length = 3
    truncate_to_repo  = true

    [git_branch]
    format = "[$symbol$branch]($style) "
    symbol = " "
    style  = "bold #${r.accent}"

    [git_status]
    format = "([$all_status$ahead_behind]($style)) "
    style  = "bold #${r.error}"

    [nix_shell]
    format = "[$symbol]($style) "
    symbol = " "
    style  = "bold #${r.link}"

    [cmd_duration]
    format   = "[ $duration]($style) "
    style    = "bold #${r.caution}"
    min_time = 2000

    [character]
    success_symbol = "[❯](bold #${r.success})"
    error_symbol   = "[❯](bold #${r.error})"
  '';
}
