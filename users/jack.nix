args@{ config, pkgs, lib, ... }:
let
    user = "jack";
    # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
    # (import "${home-manager}/nixos")
  ];

  users.users.jack = {
    extraGroups = [ "docker" "syncthing" ];
    shell = pkgs.fish;
  };

  # Activate gpg
  programs.gnupg.agent.enable = true;

  # home-manager.users.jack = {
  #   programs.home-manager.enable = true;
  #   home.stateVersion = "22.11";

  #   programs.ssh = {
  #     enable = true;
  #     matchBlocks = {
  #       "hurt" = {
  #         port = "120";
  #         hostname = "192.168.1.122";
  #         user = "admin";
  #         identityFile = "~/.ssh/hurt";
  #       };
  #     };
  #   };
  # };
}