{ config
, pkgs
, vars
, lib
, ...
}:


{

  options.our.roles.nuc = {
    enable = lib.mkEnableOption "nuc";
  };

  options.our.roles.hpserver = {
    enable = lib.mkEnableOption "hpserver";
  };

  config = mkIf config.options.our.roles.nuc.enable
    {
      imports = [
        # ./logseq.nix
        ./office.nix
        ./vim.nix
        # ./neovim.nix
        ./vscode.nix
      ];
    }
    (lib.mkIf config.our.roles.hpserver.enable
      {
        imports = [

          ./vim.nix

        ];
      }
      {
        imports = [

          ./vim.nix

        ];

      });
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



}
