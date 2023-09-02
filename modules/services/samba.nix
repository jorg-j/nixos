{ config, pkgs, ... }:
{

  # Create Samba User
  users.users.samba = {
    isNormalUser = true;
    home = "/home/samba";
    extraGroups = [ "samba" ];
    # password = "";
    hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
  };
  users.users.jack = {
    extraGroups = [ "samba" ];
  };

  services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];

  # networking.firewall.enable = true;
  # networking.firewall.allowPing = true;
  # services.samba.openFirewall = true;

  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user 
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.1. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      public = {
        path = "/home/samba/Public";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "writable" = "yes";
        "create mask" = "0765";
        "directory mask" = "0755";
        "force user" = "samba";
        "force group" = "samba";
      };
    };
  };
}
