args@{ config, pkgs, lib, ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  home-manager = {
    users.jack = {
      home.file.".gtkrc-2.0".source = ../users/jack/gtkrc-2.0;
    };
  };
}