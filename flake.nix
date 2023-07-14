{
  outputs = { self, nixpkgs }: {

    nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/surface.nix ];
      #modules = [ ./configuration.nix ];
    };
  };
}