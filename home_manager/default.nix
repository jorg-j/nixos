{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./modules
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jack = import ./home.nix;
  };

  homemanager.i3.enable = false;
  homemanager.unison.enable = true;
  homemanager.xfce.enable = false;

}
