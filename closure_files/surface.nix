import <nixpkgs/nixos> {
    system = "x86_64-linux";
    configuration = {
        imports = [
            ../hosts/surface.nix
        ];
    };
}