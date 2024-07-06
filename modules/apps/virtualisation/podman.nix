{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.podman;
in {
  options.our.software.podman = {
    enable = mkEnableOption "podman";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.podman
      pkgs.podman-desktop
      pkgs.podman-compose
    ];
    virtualisation = {
      podman = {
        enable = true;
        #   dockerSocket.enable = true; # Enable if not using docker
        autoPrune = {
          dates = "daily";
          flags = ["--all" "--volumes"];
        };
        # Create a `docker` alias for podman, to use it as a drop-in replacement
        #   dockerCompat = true;

        # Required for containers under podman-compose to be able to talk to each other.
        #   defaultNetwork.settings.dns_enabled = true;
        # For Nixos version > 22.11
        defaultNetwork.settings = lib.mkIf (config.boot.kernelPackages.kernel.version > "22.11") {
          dns_enabled = true;
        };
      };
    };
  };
}
