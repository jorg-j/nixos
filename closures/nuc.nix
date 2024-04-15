import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      ../hosts/nuc.nix
    ];
  };
}
