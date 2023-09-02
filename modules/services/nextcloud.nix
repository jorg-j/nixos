{ config, pkgs, lib, ... }:

{

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud27;
    hostName = 0.0 .0 .0;
    config.adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8080 ];
  }

    }
