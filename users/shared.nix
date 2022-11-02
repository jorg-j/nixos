{ config, options, lib, pkgs, user }:
{
    users.users.${user} = {
        isNormalUser = true;
        home = "/home/${user}";
        extraGroups = [ "wheel" "networkmanager" ];
        # password = "";
        hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    };
}