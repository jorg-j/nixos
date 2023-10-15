{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      vagrant
      ansible-core
    ];
}
