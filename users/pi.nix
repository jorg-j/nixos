args@{ config, pkgs, lib, ... }:
let
  user = "pi";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];
}
    







    