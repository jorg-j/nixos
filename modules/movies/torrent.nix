{ self, config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    radarr
    sonarr
    prowlarr


  ];
  services.radarr.enable = true;
  services.radarr.user = "jack";
  services.sonarr.enable = true;
  services.sonarr.user = "jack";
  services.prowlarr.enable = true;
  services.prowlarr.user = "jack";
}
