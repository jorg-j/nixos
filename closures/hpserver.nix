import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      ../hosts/hp_server.nix
    ];
  };
}
