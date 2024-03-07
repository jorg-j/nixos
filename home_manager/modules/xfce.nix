{ lib
, config
, ...
}:
let
  cfg = config.homemanager.xfce;
in
{
  options.homemanager.xfce = {
    enable = lib.mkEnableOption "Configure xfce using HomeManager";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.jack = {
      home.file.".config/Thunar" = {
        source = ../files/xfce_theme/Thunar; # Replace with the actual path to your source directory
        target = ".config/Thunar"; # This is the name of the directory in your home directory
      };
      home.file.".config/xfce4" = {
        source = ../files/xfce_theme/xfce4; # Replace with the actual path to your source directory
        target = ".config/xfce4"; # This is the name of the directory in your home directory
      };
    };
  };
}
