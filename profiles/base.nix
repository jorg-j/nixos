{ config, pkgs, ... }:

{
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../modules/users/jack.nix
  ];
}
