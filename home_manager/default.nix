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

  homemanager.unison.enable = false;
  homemanager.xfce.enable = false;
  # homemanager.enableNixpkgsReleaseCheck = false;
}
