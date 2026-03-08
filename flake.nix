# flake.nix
# NixOS flake entry point.
# Defines all external inputs and wires them together into the system configuration.

{
  description = "My NixOS";

  inputs = {
    # ── Core ──────────────────────────────────────────────────────────────────
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # ── Home Manager ──────────────────────────────────────────────────────────
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Use the same nixpkgs as the system

    # ── Hyprland ──────────────────────────────────────────────────────────────
    hyprland.url = "github:hyprwm/hyprland";

    # ── NixVim ────────────────────────────────────────────────────────────────
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # ── Firefox Extensions ────────────────────────────────────────────────────
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, firefox-addons, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; # Pass inputs to all NixOS modules

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs     = true;  # Use system nixpkgs in home-manager
          home-manager.useUserPackages   = true;  # Install user packages into the system profile
          home-manager.users.jannick     = import ./home/home.nix;
          home-manager.backupFileExtension = "backup"; # Backup conflicting files instead of failing
          home-manager.extraSpecialArgs  = { inherit inputs; }; # Pass inputs to home-manager modules
        }
      ];
    };
  };
}
