{ config
, pkgs
, ...
}: {
  environment.systemPackages = with pkgs; [
    vagrant
    ansible
    python311Packages.ansible-core
  ];
}
