{
  description = "My flake configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nur.url = "github:nix-community/nur";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config = { allowUnfree = true; }; };

    in
    {
      nixosConfigurations = {
        Desktop = lib.nixosSystem {
          inherit system;

          modules = [
            ./hardware-configuration.nix
            ./hosts/desktop.nix
          ];
        };
      };
    }
