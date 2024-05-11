{ config
, pkgs
, vars
, lib
, ...
}:

with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in
{
      options.our.roles.nuc.enable = lib.mkEnableOption "nuc";
  options.our.roles.hpserver.enable = lib.mkEnableOption "hpserver";
}