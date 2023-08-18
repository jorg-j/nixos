{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
      webhook
    ];

    environment.etc."webhook.conf".text = ''
    [
        {
            "id": "alert",
            "execute-command": "${pkgs.curl}/bin/curl -H "Title: 3b" -H "Priority: default" -d "3b hello" ntfy.sh/jorg_1512"
            "command-working-directory": "/tmp"
        }
    ]

    '';
}