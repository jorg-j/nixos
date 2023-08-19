{ config, pkgs, ... }:

let
  todoist_load = pkgs.callPackage ./derivation.nix { };
in

{

  environment.systemPackages = with pkgs; [
    todoist_load
  ];


}
