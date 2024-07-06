{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in {
  config = {
    services.udev.packages = [pkgs.libu2f-host];

    environment.systemPackages = with pkgs;
      if cfgNuc.enable
      then [
        celluloid
        deluge
        drawio
        imagemagick
        lightburn
        simplescreenrecorder
        okular
      ]
      else if cfgHP.enable
      then [celluloid simplescreenrecorder]
      else [];
  };
}
