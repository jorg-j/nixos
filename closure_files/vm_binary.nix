import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      ../hosts/vm_conf.nix
    ];
  };
}
