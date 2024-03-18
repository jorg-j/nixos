{
  lib,
  config,
  ...
}: let
  cfg = config.homemanager.unison;
in {
  options.homemanager.unison = {
    enable = lib.mkEnableOption "Configure unison using HomeManager";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.jack = {
      home.file = {
        ".unison/tenant.prf" = {source = "/etc/nixos/home_manager/files/tenant.prf";};
      };
    };
  };
}
