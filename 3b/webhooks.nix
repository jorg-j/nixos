{ config, pkgs, lib, ... }:

{
    environment.systemPackages[
      pkgs.webhook
      alert
    ];

    systemd.services.webhooks = {
        enable = true;
        description = "Starts the Webhook Receiver";
        after = [ "network-online.target" ];
        wantedBy = [ "network-online.target" ];

        path = with pkgs; [ webhook ];
        serviceConfig.ExecStart = "${pkgs.webhook}/bin/webhook -hooks /etc/webhook.conf -verbose";
    };

    environment.etc."webhook.conf".text = ''
    [
        {
            "id": "alert",
            "execute-command": "${pkgs.stdenv.shell} /bin/alert",
            "command-working-directory": "/"
        }
    ]
    '';


    alert = pkgs.writeScriptBin "alert" ''
        #!${pkgs.stdenv.shell}
        curl -H 'Title: 3b' -H 'Priority: default' -d '3b hello' ntfy.sh/jorg_1512
    '';

}