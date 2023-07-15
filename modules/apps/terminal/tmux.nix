{ pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
    tmux
  ];

  home-manager.users.jack = {
    home.file = {
      ".tmux/plugins/tpm" = { source = inputs.tpm; };
      ".config/tmux/tmux.conf" = { source = "${inputs.tmux-config}/tmux.conf"; };
    };
  };
}
