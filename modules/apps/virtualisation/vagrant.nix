{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      vagrant
      ansible_2_14
    ];
}
