{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs;
  [zsh];
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" ];
    theme = "afowler";
    custom = "/etc/nixos/sys/misc/plugins";
  };

}
