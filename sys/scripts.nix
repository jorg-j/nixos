{ pkgs, ... }:



let

  structure = pkgs.writeScriptBin "structure" ''
    #!${pkgs.stdenv.shell}
    sudo chmod +x /etc/nixos/desktops/Structure.sh
    /etc/nixos/desktops/Structure.sh
  '';

in
{
  environment.systemPackages = [
    structure
  ];
}



# let

#   sync = pkgs.writeScriptBin "sync" ''
#     #!${pkgs.stdenv.shell}
#     curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/vm_conf.nix | sudo tee /etc/nixos/configuration.nix
#   '';

# in
# {
#   environment.systemPackages = [
#     sync
#   ];
# }