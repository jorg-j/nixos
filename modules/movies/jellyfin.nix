{ self, config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web

  ];
}
