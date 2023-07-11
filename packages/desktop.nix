{ config, pkgs, ... }:

{
 imports = [

      ./common.nix
      ./dev.nix
      ./flatpak.nix
      ./media.nix
      ./networking.nix
      ./office.nix
      ./utilities.nix
      ./vim.nix
      ./vnc.nix
      ./vscode.nix
      

    ];
}
