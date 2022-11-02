args@{ config, pkgs, lib, vars ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

    systemd.services."home-manager-ugly-hack" = {
    script = "mkdir -p /nix/var/nix/profiles/per-user/jack && chown jack:users /nix/var/nix/profiles/per-user/jack";
    path = [ pkgs.coreutils ];
    before = [ "home-manager-jack.service" ];
    wantedBy = [ "multi-user.target" ];
  };

  home-manager = {
    users.jack = {
      home.file.".gtkrc-2.0".source = ../users/jack/gtkrc-2.0;
    };
  };
}