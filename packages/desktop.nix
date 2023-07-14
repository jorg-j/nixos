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
      ./shells/fish.nix
      ./shells/zsh.nix
    ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-21.4.0"
  ];
}
