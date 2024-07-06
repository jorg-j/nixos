{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ansible.nix
    ./vagrant.nix
    ./docker.nix
    ./podman.nix
  ];
}
