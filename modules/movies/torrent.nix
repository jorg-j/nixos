{ self, config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    radarr
    sonarr
    prowlarr


  ];
}
