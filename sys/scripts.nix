{ pkgs, ... }:

let
  structure = pkgs.writeScriptBin "structure" ''
    #!${pkgs.stdenv.shell}
    sudo chmod +x /etc/nixos/modules/desktop/Structure.sh
    /etc/nixos/modules/desktop/Structure.sh
  '';

  cdj = pkgs.writeScriptBin "cdj" ''
    #!${pkgs.stdenv.shell}
    pushd ~/Documents/*/*/*${1}*
  '';

in
{
  environment.systemPackages = [
    structure
    cdj
  ];
}

