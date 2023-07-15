
{ config, lib, pkgs, ... }:

{

  imports =
    [
      ./vagrant.nix
    ];

  virtualisation = {
    docker = {
      autoPrune = {
        dates = "daily";
        flags = ["--all" "--volumes"];
      };
      enable = true;
    };
    virtualbox.host.enable = true;
  };

}
