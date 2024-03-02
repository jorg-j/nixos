{ config, pkgs, vars, ... }:
{
  imports =
    [
      # ./logseq.nix
      ./office.nix
      ./vim.nix
      ./neovim.nix
      ./vscode.nix
      # ./obsidian.nix # disabled in favor of flatpak
    ];
  environment.systemPackages = with pkgs;
    [

      simplenote
      fuse

      arduino-ide

      # obsidian

    ];
}
