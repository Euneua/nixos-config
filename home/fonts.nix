# fonts.nix
# Font configuration for the system.
# JetBrainsMono Nerd Font is used across all applications (terminal, editor, bar).
# Noto Color Emoji provides emoji support system-wide.

{ config, pkgs, ... }:
{
  # Font packages installed via Nix
  home.packages = with pkgs; [
    # JetBrainsMono Nerd Font: extends JetBrains Mono with Nerd Font icons
    # Used in Ghostty, Neovim, Waybar and Rofi
    nerd-fonts.jetbrains-mono
    # Full-color emoji support
    noto-fonts-color-emoji
  ];

  # Set system-wide font defaults via fontconfig
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
}
