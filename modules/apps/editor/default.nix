{ config, pkgs, vars, ... }:
{
  imports =
    [
      ./logseq.nix
      ./office.nix
      ./vim.nix
      ./neovim.nix
      ./vscode.nix
      ./obsidian.nix
    ];
  environment.systemPackages = with pkgs;
    [

      simplenote
      fuse
      logseq
      stdenv.cc.cc.lib
      # obsidian

    ];
}
