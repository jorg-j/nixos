args@{ config, pkgs, lib, ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];


  users.users.jack = {
    extraGroups = [ "docker" "syncthing" ];
    shell = pkgs.fish;


  };
   # Activate gpg
    programs.gnupg.agent.enable = true;

    # No need to use users."${system.singleUser}" as we already know it
    home-manager.users.jack = {
      programs.home-manager.enable = true;
      home.stateVersion = "22.11";

      programs.ssh = {
        enable = true;
        matchBlocks = {
          "hurt" = {
            port = "120";
            hostname = "192.168.1.122";
            user = "admin";
            identityFile = "~/.ssh/hurt";

          };

        };
      };
 }