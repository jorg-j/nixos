{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./python
    # ./rust
    ./sqlite.nix
  ];

  environment.systemPackages = with pkgs; [
    pkgs.gnumake
    pkgs.go-task

    pkgs.nixos-generators
    pkgs.fly # concourse-ci

    # Devenv
    pkgs.cachix
    (import (fetchTarball https://install.devenv.sh/latest)).default
    # nixops

    pkgs.alejandra

  ];
}
