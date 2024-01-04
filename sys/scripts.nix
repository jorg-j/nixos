{ pkgs, ... }:

let
  structure = pkgs.writeScriptBin "structure" ''
    #!${pkgs.stdenv.shell}
    sudo chmod +x /etc/nixos/modules/desktop/Structure.sh
    /etc/nixos/modules/desktop/Structure.sh
  '';


in
{
  environment.systemPackages = [
    structure
  ];

  environment.shellInit = ''
    cdj() {
       pushd ~/Documents/*/*/*''${1}*
      }

    notify() {
      curl -H "Title: Nuc notify" -d "$1" ntfy.sh/jorg_1512
      }
  '';
}

