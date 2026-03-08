# hardware.nix
# GPU driver configuration for Intel + NVIDIA RTX 4060 Optimus laptop.
# Uses NVIDIA Prime offload mode – the Intel GPU handles the display,
# the NVIDIA GPU is used on-demand via `nvidia-offload <command>`.

{ config, pkgs, lib, ... }:
{
  # ── OpenGL ──────────────────────────────────────────────────────────────────
  hardware.graphics.enable = true;

  # ── GPU Drivers ─────────────────────────────────────────────────────────────
  services.xserver.videoDrivers = [
    "nvidia"      # NVIDIA proprietary driver
    "modesetting" # Intel GPU driver
  ];

  # ── NVIDIA Optimus (Prime Offload) ──────────────────────────────────────────
  hardware.nvidia = {
    prime = {
      offload = {
        enable          = true; # Enable Prime offload mode
        enableOffloadCmd = true; # Adds the `nvidia-offload` wrapper command
      };
      intelBusId  = "PCI:0:2:0"; # Intel integrated GPU
      nvidiaBusId = "PCI:1:0:0"; # NVIDIA RTX 4060
    };

    modesetting.enable = true; # Required for Wayland and Hyprland

    # Power management disabled – enable if suspend/resume causes issues
    powerManagement.enable      = false;
    powerManagement.finegrained = false; # Fine-grained turns off GPU when idle (experimental)

    open           = true;  # Use the open-source NVIDIA kernel module (required for Turing+)
    nvidiaSettings = true;  # Install the nvidia-settings GUI tool
    package        = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
