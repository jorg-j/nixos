{ self, config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    radarr
    sonarr
    prowlarr


  ];
  services.radarr.enable = true;
  services.sonarr.enable = true;
  services.prowlarr.enable = true;
}
