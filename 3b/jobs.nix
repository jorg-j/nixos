{
  config,
  pkgs,
  ...
}: let
  ntfy_channel = "jorg_1512";
in {
  systemd.services.start_notify = {
    enable = true;
    description = "Sends an alive message at start containing the current IP";
    after = ["network-online.target"];
    wantedBy = ["network-online.target"];

    path = with pkgs; [bash curl];
    script = ''
      MYIP=$(${pkgs.unixtools.ifconfig}/bin/ifconfig | grep -oP '(?<=inet\s)(192.168.1.\d+)')
      curl \
        -H "Title: 3b" \
        -H "Priority: default" \
        -d "3b online: $MYIP" \
        ntfy.sh/${ntfy_channel}
    '';
  };
}
