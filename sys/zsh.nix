{ config, pkgs, ... }:


{
programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
};


programs.zsh = {

 ohMyZsh = {
    enable = true;
    plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
    theme = "robbyrussell";
  };
};
}