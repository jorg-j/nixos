{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./discord.nix
    ./telegram.nix
  ];
}
