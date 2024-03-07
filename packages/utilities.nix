{ config
, pkgs
, ...
}: {
  imports = [
    ../modules/desktop/xfce_theme.nix
  ];

  environment.systemPackages = with pkgs; [
    caffeine-ng
    lightburn
    cura
  ];
}
