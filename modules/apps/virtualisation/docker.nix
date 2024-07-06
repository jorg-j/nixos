{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.docker;
in {
  options.our.software.docker = {
    enable = mkEnableOption "docker";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.docker-compose
    ];
    virtualisation = {
      docker = {
        autoPrune = {
          dates = "daily";
          flags = ["--all" "--volumes"];
        };
        enable = true;
        extraOptions = ''
          --insecure-registry "http://192.168.1.122:5000"
        '';
      };
      virtualbox.host.enable = true;
    };
  };
}
