import <nixpkgs/nixos> {
  system = "aarch64-linux";
  configuration = {
    imports = [
      ../4b/default.nix
    ];
    # This overlay is for the 4b build so it doesnt shit itself if a module is cooked
    nixpkgs.overlays = [
      (final: super: {
        makeModulesClosure = x:
          super.makeModulesClosure (x // {allowMissing = true;});
      })
    ];
  };
}
