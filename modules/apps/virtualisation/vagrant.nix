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
        vagrant
        ansible
        python311Packages.ansible-core
      ]
      else if cfgHP.enable
      then []
      else [];
  };
}
