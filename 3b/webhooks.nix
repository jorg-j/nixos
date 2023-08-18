{ config, pkgs, lib, ... }:

{
    imports = [
        ./webhook_scripts/alert2.nix
    ];

    environment.systemPackages = [
      pkgs.webhook
    ];

    networking.firewall.allowedTCPPorts = [ 9000 ];

    users.users.webhook = {
        isNormalUser = true;
    };

    systemd.services.webhooks = {
        enable = true;
        description = "Starts the Webhook Receiver";
        after = [ "network-online.target" ];
        wantedBy = [ "network-online.target" ];

        # This path has to be here so systemd can see the packages
        path = with pkgs; [ config.nix.package.out ];
        serviceConfig.User = "webhook";
        serviceConfig.ExecStart = "${pkgs.webhook}/bin/webhook -hooks /etc/webhook.conf -verbose";
    };


    nixpkgs.overlays = [
        (self: super: {
        alert = pkgs.writeScriptBin "alert" ''
        #!${pkgs.stdenv.shell}

        ${pkgs.curl}/bin/curl -H 'Title: 3b' -H 'Priority: default' -d '3b hello' ntfy.sh/jorg_1512
        '';
        })];

    environment.etc."webhook.conf".text = ''
    [
        {
            "id": "alert",
            "execute-command": "${pkgs.alert}/bin/alert",
            "response-message": "Received",
            "command-working-directory": "/tmp"
        },
        {
            "id": "alert2",
            "execute-command": "${pkgs.alert}/bin/alert2",
            "command-working-directory": "/tmp",
            "response-message": "Received",
            "pass-arguments-to-command":
            [
                {
                    "source": "headers",
                    "name": "message"
                }
            ]
        }
    ]
    '';

}