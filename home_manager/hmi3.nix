{
  config,
  lib,
  pkgs,
  ...
}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
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

  homemanager.i3.enable = true;
  # homemanager.unison.enable = true;
  homemanager.xfce.enable = false;
}
