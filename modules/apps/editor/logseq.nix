{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  # unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
  cfg = config.our.software.logseq;
in {
  options.our.software.logseq = {
    enable = mkEnableOption "logseq";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.logseq
    ];
  };
}
