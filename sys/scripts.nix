{ pkgs, ... }:

let
  structure = pkgs.writeScriptBin "structure" ''
    #!${pkgs.stdenv.shell}
    sudo chmod +x /etc/nixos/modules/desktop/Structure.sh
    /etc/nixos/modules/desktop/Structure.sh
  '';

  estructure = pkgs.writeScriptBin ",edit_structure" ''
    #!${pkgs.stdenv.shell}
    vim /home/jack/Documents/20-29_Programming_Software/20_Infrastructure/20.03_NixOS/nixos/modules/desktop/Structure.sh
  '';

  nixpush = pkgs.writeScriptBin ",nixpush" ''
    #!${pkgs.stdenv.shell}
    cd /home/jack/Documents/20-29_Programming_Software/20_Infrastructure/20.03_NixOS/nixos
    git add --update
    echo -n "Commit Message: "
    read msg
    git commit --message "$msg"
    git pull --rebase
    git push
  '';

  binls = pkgs.writeScriptBin ",ls" ''
    #!${pkgs.stdenv.shell}
    echo "structure - run structure setup"
    echo ",edit_structure - edit the structure file"
    echo ",nixpush - add and push the current changes to the repo"
  '';

in
{
  environment.systemPackages = [
    structure
    estructure
    binls
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

