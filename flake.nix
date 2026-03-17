# flake.nix
# NixOS flake entry point.
# Defines all external inputs and wires them together into the system configuration.
{
  description = "My NixOS";

  inputs = {
    # ── Core ──────────────────────────────────────────────────────────────
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # ── Home Manager ──────────────────────────────────────────────────────
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # ── Hyprland ──────────────────────────────────────────────────────────
    hyprland.url = "github:hyprwm/hyprland";

    # ── Firefox Extensions ────────────────────────────────────────────────
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs        = true;
          home-manager.useUserPackages      = true;
          home-manager.users.jannick        = import ./home;
          home-manager.backupFileExtension  = "backup";
          home-manager.extraSpecialArgs     = { inherit inputs; };
        }
      ];
    };
  };
}