{ config, pkgs, ... }:

{
  imports = [
    ./python
  ];


  environment.systemPackages = with pkgs;
    [
      gnumake
      sqlitebrowser
      nixos-generators
      cachix
      # nixops
    ];

  # devenv
  environment.systemPackages = [
    (import (fetchTarball https://install.devenv.sh/latest)).default
  ];
}
