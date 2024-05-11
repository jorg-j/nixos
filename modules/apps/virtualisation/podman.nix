{ pkgs
, lib
, config
, ...
}:

with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in
{

# Podman is controlled via the nuc role. switched in hosts/nuc.nix and managed in sys/configopts.nix

  config = {
    environment.systemPackages = with pkgs;
      if cfgNuc.enable then
        [
          podman
          podman-desktop
          podman-compose
        ]
      else if cfgHP.enable then # HP is disabled at this time
        [ ]
      else
        [ ];

    virtualisation =
      if cfgNuc.enable then
        {
          podman = {
            enable = true;
            #   dockerSocket.enable = true; # Enable if not using docker
            autoPrune = {
              dates = "daily";
              flags = [ "--all" "--volumes" ];
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
        }
      else if cfgHP.enable then # HP is disabled at this time
        { }
      else
        { };


  };





}
