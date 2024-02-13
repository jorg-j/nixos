{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      vagrant
      ansible
      python310Packages.ansible-core

    ];
}
