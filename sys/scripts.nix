{ pkgs, ... }:

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