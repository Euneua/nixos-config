# Main NixOS system configuration.
# Hardware-specific settings live in hardware.nix and hardware-configuration.nix.

{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix  # Auto-generated hardware config (do not edit manually)
    ./hardware.nix                # GPU, drivers and hardware tweaks
  ];

  # ── Nix Settings ────────────────────────────────────────────────────────────
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # Hyprland binary cache – speeds up builds by providing pre-built binaries
    substituters         = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys  = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # ── Hyprland ────────────────────────────────────────────────────────────────
  # Use the Hyprland flake input instead of the nixpkgs version
  programs.hyprland = {
    enable        = true;
    package       = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # ── OBS Studio ──────────────────────────────────────────────────────────────
  programs.obs-studio = {
    enable  = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture  # Vulkan/OpenGL game capture
    ];
  };

  # ── Display Manager ─────────────────────────────────────────────────────────
  services.displayManager = {
    sddm = {
      enable          = true;
      wayland.enable  = true;  # Run SDDM on Wayland
    };
    autoLogin = {
      enable = true;
      user   = "jannick";
    };
  };

  # ── Bootloader ──────────────────────────────────────────────────────────────
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ── Networking ──────────────────────────────────────────────────────────────
  networking.hostName            = "nixos";
  networking.networkmanager.enable = true;

  # ── Bluetooth ───────────────────────────────────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable   = true;

  # ── Locale & Timezone ───────────────────────────────────────────────────────
  time.timeZone      = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8"; # UI in English for better error searchability

  # German locale settings for regional formats (date, currency, units etc.)
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT    = "de_DE.UTF-8";
    LC_MONETARY       = "de_DE.UTF-8";
    LC_NAME           = "de_DE.UTF-8";
    LC_NUMERIC        = "de_DE.UTF-8";
    LC_PAPER          = "de_DE.UTF-8";
    LC_TELEPHONE      = "de_DE.UTF-8";
    LC_TIME           = "de_DE.UTF-8";
  };

  # ── Keyboard ────────────────────────────────────────────────────────────────
  services.xserver.xkb = {
    layout  = "de";
    variant = "";
  };
  console.keyMap = "de"; # TTY keyboard layout

  # ── Audio ───────────────────────────────────────────────────────────────────
  # PipeWire handles all audio with ALSA and PulseAudio compatibility layers
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true; # Required for some games and older applications
    pulse.enable      = true; # PulseAudio compatibility
  };

  # ── Keyring ─────────────────────────────────────────────────────────────────
  # Required for apps that use secret storage (e.g. Tutanota)
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprlock.enableGnomeKeyring = true;

  # ── Flatpak ─────────────────────────────────────────────────────────────────
  # Required for Threema and other apps not available in nixpkgs
  services.flatpak.enable = true;

  # ── nix-ld ──────────────────────────────────────────────────────────────────
  # Allows running dynamically linked binaries not built for NixOS
  programs.nix-ld.enable = true;
 
  # ── Steam ───────────────────────────────────────────────────────────────────
  programs.steam.enable = true;

  # ── User ────────────────────────────────────────────────────────────────────
  users.users.jannick = {
    isNormalUser = true;
    description  = "Jannick";
    extraGroups  = [ "networkmanager" "wheel" ]; # wheel = sudo access
    packages     = with pkgs; [];
  };

  # ── Packages ────────────────────────────────────────────────────────────────
  nixpkgs.config.allowUnfree   = true; # Required for JetBrains Toolbox, NVIDIA drivers etc.
  environment.systemPackages   = with pkgs; [];

  system.stateVersion = "25.11";
}
