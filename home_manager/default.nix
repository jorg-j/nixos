{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.jack = { pkgs, ... }: {
    home.packages = [  ];
    home.stateVersion = "22.11";
  };


}