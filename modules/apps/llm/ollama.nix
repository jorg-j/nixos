{ config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/cdbfd046bffaf2a61ae1b9ef6aecb68fb6b312ec)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in
{
  environment.systemPackages = with pkgs; [
    unstable.ollama
  ];
}
