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
      # nixops
    ];
}
