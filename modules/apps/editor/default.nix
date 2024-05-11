{ config
, pkgs
, vars
, lib
, ...
}:

let
  cfgNuc = config.out.roles.nuc;
  cfgHP = config.out.roles.hpserver;
in
{
  options.our.roles.nuc.enable = lib.mkEnableOption "nuc";
  options.our.roles.hpserver.enable = lib.mkEnableOption "hpserver";
  
  config = lib.mkIf cfgNuc.enable {
    imports = [
      # ./logseq.nix
      ./office.nix
      ./vim.nix
      # ./neovim.nix
      ./vscode.nix
    ];
  } (lib.mkIf cfgHP.enable
    {
      imports = [
        ./vim.nix
      ];
    }
    {
      imports = [
        ./vim.nix
      ];
    }
  );
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

}
