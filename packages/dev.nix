{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
        python39Full         # Python 3.9
        python39Packages.pip
        python39Packages.virtualenv

        poetry               # Poetry

    ];
}