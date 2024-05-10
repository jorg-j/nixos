{ config
, pkgs
, vars
, lib
, ...
}:


{


  imports =[
      # ./logseq.nix
      ./office.nix
      ./vim.nix
      # ./neovim.nix
      ./vscode.nix
    ];


  environment.systemPackages = [
      pkgs.fuse
      pkgs.arduino
      pkgs.logseq
    ];

}
