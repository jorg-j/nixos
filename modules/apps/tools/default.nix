{pkgs, ...}: {
  imports = [
    ./3d.nix
    ./backup.nix
    ./base.nix
    ./cmix.nix
    ./compression.nix
    ./http.nix
    ./json.nix
    ./media.nix
    ./network.nix
    ./raspberry.nix
    ./search.nix
    ./text_expander.nix
  ];
}
