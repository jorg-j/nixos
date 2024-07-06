{
  config,
  pkgs,
  vars,
  lib,
  ...
}: {
  imports = [./vim.nix ./office.nix ./vscode.nix ./logseq.nix ./arduino.nix];

  environment.systemPackages = [
    pkgs.fuse
  ];
}
