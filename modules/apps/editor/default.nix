{ config
, pkgs
, vars
, lib
, ...
}:

with lib; let
  cfgHP = config.our.roles.hpserver;
in
{
  options.our.roles.hpserver = {
    enable = mkEnableOption "hpserver";
  };

  # imports = lib.mkIf cfgHp.enable [ ./vim.nix ];

  # config = mkIf cfgHp.enable {
  #   environment.systemPackages = [
  #     pkgs.fuse
  #   ];
  # };


    imports = [
      ./vim.nix
    ];

    environment.systemPackages = [
      pkgs.fuse
    ];


  # imports =
  #   if config.networking.hostName == "nuc" then [
  #     # ./logseq.nix
  #     ./office.nix
  #     ./vim.nix
  #     # ./neovim.nix
  #     ./vscode.nix
  #   ]
  #   else [
  #     ./vim.nix
  #   ];


  # environment.systemPackages =
  #   if config.networking.hostName == "nuc" then [
  #     pkgs.fuse

  #     pkgs.arduino
  #     pkgs.logseq
  #   ]
  #   else [
  #     pkgs.fuse
  #   ];

}
