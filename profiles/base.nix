{ config, pkgs, ... }:

{
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../users/jack.nix
  ];
}
