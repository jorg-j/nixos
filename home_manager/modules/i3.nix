{ lib
, config
, ...
}:
let
  cfg = config.homemanager.i3;
in
{
  options.homemanager.i3 = {
    enable = lib.mkEnableOption "Configure i3 using HomeManager";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.jack = {
      home.file = {
        ".config/i3/config" = { source = "/etc/nixos/home_manager/files/i3_config"; };
        ".config/i3status/config" = { source = "/etc/nixos/home_manager/files/i3status.conf"; };
        ".mnti3/mounter" = { source = "/etc/nixos/home_manager/files/mounter"; };
        ".mnti3/unmounter" = { source = "/etc/nixos/home_manager/files/unmounter"; };
      };
    };
  };
}
