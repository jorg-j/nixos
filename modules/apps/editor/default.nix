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

  imports = [./vim.nix];
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


