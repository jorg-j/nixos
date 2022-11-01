{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
        python39Full         # Python 3.9
        poetry               # Poetry

    ];
}