{ pkgs, ... }:

let
  structure = pkgs.writeScriptBin "structure" ''
    #!${pkgs.stdenv.shell}
    sudo chmod +x /etc/nixos/modules/desktop/Structure.sh
    /etc/nixos/modules/desktop/Structure.sh
  '';

  mounter = pkgs.writeScriptBin "mounter" (import ./files/mounter);
  unmounter = pkgs.writeScriptBin "mounter" (import ./files/unmounter);

in
{
  environment.systemPackages = [
    structure
    mounter
    unmounter
  ];

  environment.shellInit = ''
    cdj() {
       pushd ~/Documents/*/*/*''${1}*
      }
  '';
}

