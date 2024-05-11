{ config
, pkgs
, vars
, lib
, ...
}:

with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in
{

  imports = [ ./vim.nix ./office.nix ./vscode.nix];

  config = {

    environment.systemPackages =
      if cfgNuc.enable then
        [
          pkgs.fuse
          pkgs.arduino
          pkgs.logseq
        ]
      else if cfgHP.enable then
        [
          pkgs.fuse
        ]
      else
        [
          pkgs.fuse
        ];


  };

}

