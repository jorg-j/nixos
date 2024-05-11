{ config
, pkgs
, vars
, lib
, ...
}:

with lib; let

cfgNuc = config.our.roles.nuc;

in {

options.our.roles.nuc = {
  enable = mkEnableOption "nuc";
  };


config = {

  imports = 
  if cfgNuc.enable
  then [
      # ./logseq.nix
      ./office.nix
      ./vim.nix
      # ./neovim.nix
      ./vscode.nix
    ]
  else [
    ./vim.nix
  ];



  environment.systemPackages =
    if cfgNuc.enable
    then [ 
      pkgs.fuse
      pkgs.arduino
      pkgs.logseq
      ]
    else [ 
      pkgs.fuse
    ];
  };



}
