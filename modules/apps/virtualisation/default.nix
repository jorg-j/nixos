{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./vagrant.nix
    ./docker.nix
    ./podman.nix
  ];
}
