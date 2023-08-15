{ pkgs ? import <nixpkgs> {} }:

{

    environment.systemPackages = with pkgs; [
        mytest
    ];

    mytest = pkgs.callPackage ./derivation.nix {};

}