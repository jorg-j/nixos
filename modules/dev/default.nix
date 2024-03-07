{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./python
  ];

  environment.systemPackages = with pkgs; [
    pkgs.gnumake
    pkgs.go-task
    pkgs.sqlitebrowser
    pkgs.nixos-generators
    pkgs.fly # concourse-ci
    # Devenv
    pkgs.cachix
    (import (fetchTarball https://install.devenv.sh/latest)).default
    # nixops

    pkgs.alejandra
  ];
}
