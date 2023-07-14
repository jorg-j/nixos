{
  outputs = { self, nixpkgs }: {

    nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}