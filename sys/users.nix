{
  config,
  pkgs,
  lib,
  ...
}: {
  # === Setup Users ===
  users.users = {
    root = {};
    jack = {
      isNormalUser = true;
      home = "/home/nixos";
      extraGroups = ["wheel" "networkmanager"];
      # password = "";
      # initialPassword = "testpw";
      hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    };
  };
}
