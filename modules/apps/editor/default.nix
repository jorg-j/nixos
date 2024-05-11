{ config
, pkgs
, vars
, lib
, ...
}:

with lib; let
  cfgNuc = config.out.roles.nuc;
  cfgHP = config.out.roles.hpserver;
in
{
  options.our.roles.nuc.enable = mkEnableOption "nuc";
  options.our.roles.hpserver.enable = mkEnableOption "hpserver";

  config = {
    imports =
      if cfgNuc.enable then
        [
          # ./logseq.nix
          ./office.nix
          ./vim.nix
          # ./neovim.nix
          ./vscode.nix
        ]
      else if cfgHP.enable then
        [
          ./vim.nix
        ]
      else
        [
          ./vim.nix
        ];

    environment.systemPackages = [
      pkgs.fuse

    ];
  };

    }

# config = {

#   imports = 
#   if cfgNuc.enable
#   then [
#       # ./logseq.nix
#       ./office.nix
#       ./vim.nix
#       # ./neovim.nix
#       ./vscode.nix
#     ]
#   else [
#     ./vim.nix
#   ];



#   environment.systemPackages =
#     if cfgNuc.enable
#     then [ 
#       pkgs.fuse
#       pkgs.arduino
#       pkgs.logseq
#       ]
#     else [ 
#       pkgs.fuse
#     ];
#   };

## Default
# imports = [
#   # ./logseq.nix
#   ./office.nix
#   ./vim.nix
#   # ./neovim.nix
#   ./vscode.nix
# ];
#   environment.systemPackages = [ 
#       pkgs.fuse
#       pkgs.arduino
#       pkgs.logseq
#       ];


