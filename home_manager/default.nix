{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jack = import ./home.nix;
  };

}