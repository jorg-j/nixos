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
    environment.systemPackages = with pkgs;
      if cfgNuc.enable
      then [
        tdesktop
        discord
      ]
      else if cfgHP.enable
      then []
      else [];
  };
}
