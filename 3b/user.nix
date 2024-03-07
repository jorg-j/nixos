{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.jack = {
    isNormalUser = true;
    uid = 1000;
    description = "Jack";
    home = "/home/jack";
    extraGroups = [
      "wheel"
      "networkmanager"
      "vboxusers"
      "dialout"
    ];

    createHome = true;
    hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    shell = pkgs.bash;
  };

  # Activate gpg
  programs.gnupg.agent.enable = true;
}
