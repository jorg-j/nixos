{ config
, pkgs
, ...
}: {
  # imports = [
  #   ./pantheon.nix
  # ];

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "23.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" "git" ];
      theme = "agnoster";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
    envExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
    '';
  };

  home.file = {
    ".ssh/config" = { source = "/etc/nixos/home_manager/files/ssh_config"; };

    ".config/nixpkgs/config.nix" = { source = "/etc/nixos/home_manager/files/nixpkgs_config.nix"; };
    # ".config/Code/User/settings.json" = { source = "/etc/nixos/home_manager/files/vscode.json"; };
  };
}
