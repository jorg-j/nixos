{ config, pkgs, ... }:


{
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../modules/users/jack.nix
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-21.4.0"
  ];
}