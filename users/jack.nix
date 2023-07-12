args@{ config, pkgs, lib, ... }:
let
    user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];


  users.users.jack = {
    extraGroups = [ "docker" ];

    extraConfig = ''
    echo "Host tenant
        HostName tenant.local
        User pi

    Host yeti
        HostName 192.168.1.161
        User jack

    Host *
        StrictHostKeyChecking no

    Host 192.168.1.*
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
        LogLevel=quiet

    Host capaldi
        HostName 192.168.1.105
        User pi

    Host yeit-tail
        Hostname 100.87.208.54
        User jack

    Host capaldi-tail
        HostName 100.69.77.123
        User pi

    Host smith
        Hostname 192.168.1.120
        User root

    Host clara
        Hostname 192.168.1.152
        User pi" > /home/jack/.ssh/config
    '';
  };

 }