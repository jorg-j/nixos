import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      ../hosts/surface.nix
    ];
    nixpkgs.overlays = [
      (final: super: {
        makeModulesClosure = x:
          super.makeModulesClosure (x // {allowMissing = true;});
      })
    ];
  };
}
