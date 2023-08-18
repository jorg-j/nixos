{ config, pkgs, lib, ... }:

{
    nixpkgs.overlays = [
    (self: super: {
    alert2 = pkgs.writeScriptBin "alert2" ''
    #!${pkgs.stdenv.shell}

    ${pkgs.curl}/bin/curl -H 'Title: 3b' -H 'Priority: default' -d '$1' ntfy.sh/jorg_1512
    '';
    })
    ];
}