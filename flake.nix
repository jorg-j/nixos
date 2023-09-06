{
  description = "flake for Desktop";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.05";
      # url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in

    {
      nixosConfigurations = {
        Desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./hosts/desktop.nix
          ];
        };

      };
      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    };
}
