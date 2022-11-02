{
  description = "Unstable + HM";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "/nixpkgs";
    };
  };

     hosts = map (pkgs.lib.removeSuffix ".nix") (
        pkgs.lib.attrNames (
          pkgs.lib.filterAttrs
            (_: entryType: entryType == "regular")
            (builtins.readDir ./hosts)
        )
      );

      build-target = host: {
        name = host;

        value = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            nixpkgs.nixosModules.notDetected
            home-manager.nixosModules.home-manager
            (import (./hosts + "/${host}.nix"))
          ];
        };
      };

      live-usb = {
        name = "live-usb";
        value = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix"
            nixpkgs.nixosModules.notDetected
            home-manager.nixosModules.home-manager
            (import ./live-usb/live-usb.nix)
          ];
        };
      };

}