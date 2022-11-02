args@{ config, pkgs, lib, ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];

  home-manager = {
    users.jack = {
      home.file.".gtkrc-2.0".source = ../users/jack/gtkrc-2.0;
    };
  };
}