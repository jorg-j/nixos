{ config, pkgs, ... }:

{
  imports = [
    ./python
  ];


  environment.systemPackages = with pkgs;
    [
      pkgs.gnumake
      pkgs.sqlitebrowser
      pkgs.nixos-generators
      # Devenv
      pkgs.cachix
      (import (fetchTarball https://install.devenv.sh/latest)).default
      # nixops
    ];

}
