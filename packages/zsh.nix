{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs;
  [zsh];
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
    theme = "afowler";
    custom = "/etc/nixos/sys/misc/plugins";
  };
  users.users.jack = {
          shell = pkgs.zsh;
  };
}
