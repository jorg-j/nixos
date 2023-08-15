{ config, pkgs, ... }:

let
mytest = pkgs.callPackage ./derivation.nix {};

in

{

    environment.systemPackages = with pkgs; [
        mytest
    ];


}