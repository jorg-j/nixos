{ config, pkgs, ... }:

{
 imports = [

      ./common.nix
      ./dev.nix
      ./networking.nix
      ./media.nix
      ./office.nix
      ./utilities.nix
      ./vim.nix
      ./vnc.nix
      ./vscode.nix
      ./flatpak.nix

    ];
}
