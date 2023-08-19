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
        flags = [ "--all" "--volumes" ];
      };
      enable = true;
      extraOptions = ''
        --insecure-registry "http://192.168.1.122:5000"
      '';
    };
    virtualbox.host.enable = true;
  };

}
