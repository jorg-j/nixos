args @ { config
, pkgs
, lib
, ...
}:
let
  user = "jack";
in
{
  imports = [
    (import ./shared.nix (args // { user = user; }))
  ];

  users.users.jack = {
    isNormalUser = true;
    extraGroups = [ "docker" "syncthing" ];
    shell =
      if config.networking.hostName == "tenant"
      then pkgs.bash
      else pkgs.zsh;
  };

  # Activate gpg
  programs.gnupg.agent.enable = true;
}
