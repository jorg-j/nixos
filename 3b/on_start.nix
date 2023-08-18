{ config, pkgs, ... }:

{

  systemd.services.start_notify = {
    enable = true;
    description = "Sends an alive message at start";
    after = [ "network-online.target" ];
    wantedBy = [ "network-online.target" ];
    # serviceConfig = {
    #   Restart = "always";
    #   RestartSec = "60";
    # };
    path = with pkgs; [ bash curl ];
    script = ''
      curl \
        -H "Title: 3b" \
        -H "Priority: default" \
        -d "3b online" \
        ntfy.sh/jorg_1512
    '';
  };

}