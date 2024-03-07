{ config
, pkgs
, ...
}:
let
  unstable =
    import
      (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master)
      # reuse the current configuration
      { config = config.nixpkgs.config; };
in
{
  environment.systemPackages = with pkgs; [
    unstable.rustc
    unstable.just
    unstable.cosmic-icons
    unstable.cosmic-settings
    unstable.cosmic-greeter
    unstable.cosmic-launcher
  ];
}
# https://nixos.wiki/wiki/COSMIC

