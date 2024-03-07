{ config
, pkgs
, ...
}: {
  imports = [
    ./ollama.nix
  ];
}
