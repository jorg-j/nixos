{ config, pkgs, ... }:

{
  # make the tailscale command usable to users
  environment.systemPackages = [ pkgs.tailscale ];

  # enable the tailscale service
  services.tailscale.enable = true;


  services.openssh.extraConfig = ''
  Host tenant
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
      User pi

  '';
}
