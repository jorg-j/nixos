import <nixpkgs/nixos> {
    system = "aarch64-linux";
    configuration = {
        imports = [
            ../hosts/rpi3.nix
        ];
    };
}