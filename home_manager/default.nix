{
  config,
  lib,
  pkgs,
  ...
}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
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
