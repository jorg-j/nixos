args@{ config, pkgs, lib, ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];


  users.users.jack = {
    extraGroups = [ "docker" ];


  };

 }