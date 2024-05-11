{
  config,
  pkgs,
  lib,
  ...
}: let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;

  unstable =
    import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/cdbfd046bffaf2a61ae1b9ef6aecb68fb6b312ec)
    # reuse the current configuration
    {config = config.nixpkgs.config;};
in {
  config = {
    environment.systemPackages = with pkgs;
      if cfgNuc.enable then
        [
    unstable.ollama
        ]
      else if cfgHP.enable then
        [ ]
      else
        [ ];

  };

}