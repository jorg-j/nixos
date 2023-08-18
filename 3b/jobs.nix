{ config, pkgs, ... }:

{

  systemd.services.start_notify = {
    enable = true;
    description = "Sends an alive message at start";
    after = [ "network-online.target" ];
    wantedBy = [ "network-online.target" ];

    path = with pkgs; [ bash curl ];
    script = ''
      MYIP=$(ifconfig | grep -oP '(?<=inet\s)(192.168.1.\d+)')
      curl \
        -H "Title: 3b" \
        -H "Priority: default" \
        -d "3b online: $MYIP" \
        ntfy.sh/jorg_1512
    '';
  };

}

