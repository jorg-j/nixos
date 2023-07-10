{ config, pkgs, ... }:


{

    services.cron = {
        enable = true;
        systemCronJobs = [
            "* * * * * root rebuild"
        ];
    };
}