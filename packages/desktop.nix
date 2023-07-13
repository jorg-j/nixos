{ config, pkgs, ... }:

{
 imports = [

      ./common.nix
      ./dev.nix
      ./media.nix
      ./networking.nix
      ./office.nix
      ./utilities.nix
      ./vim.nix
      ./vnc.nix
      ./vscode.nix
      ./zsh.nix
    ];
}
