{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.ollama;
  unstable =
    import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/cdbfd046bffaf2a61ae1b9ef6aecb68fb6b312ec)
    # reuse the current configuration
    {config = config.nixpkgs.config;};
in {
  options.our.software.ollama = {
    enable = mkEnableOption "ollama";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lmstudio
      unstable.ollama
    ];
  };
}
