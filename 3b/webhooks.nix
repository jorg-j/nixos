{ config, pkgs, lib, ... }:

{
    environment.systemPackages = [
      pkgs.webhook
    ];

    users.users.webhook = {
        isNormalUser = true;
    };

    systemd.services.webhooks = {
        enable = true;
        description = "Starts the Webhook Receiver";
        after = [ "network-online.target" ];
        wantedBy = [ "network-online.target" ];

        path = with pkgs; [ config.nix.package.out ];
        serviceConfig.User = "webhook";
        serviceConfig.ExecStart = "${pkgs.webhook}/bin/webhook -hooks /etc/webhook.conf -verbose";
    };


    nixpkgs.overlays = [(self: super: {
        alert = pkgs.writeScriptBin "alert" ''
        #!${pkgs.stdenv.shell}

        ${pkgs.curl}/bin/curl -H 'Title: 3b' -H 'Priority: default' -d '3b hello' ntfy.sh/jorg_1512
        '';
        })];

    environment.etc."webhook.conf".text = ''
    [
        {
            "id": "alert",
            "execute-command": "${pkgs.alert}/bin/alert,
            "command-working-directory": "/tmp"
        }
    ]
    '';

}