
{ config, lib, pkgs, ... }:

{

  imports =
    [
      ./vagrant.nix
    ];
    
  environment.systemPackages = with pkgs; [
    docker-compose
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
