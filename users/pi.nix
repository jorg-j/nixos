args@{ pkgs, lib, ... }:
let
    user = "pi";
in
{
  imports = [
    ./shared.nix (args // { user = user; })
  ];
}