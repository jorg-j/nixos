{
  imports = [
    ./apps/virtualisation/docker.nix
    ./apps/editor
    ./apps/monitoring
    ./apps/scm
    ./apps/shell
    ./apps/tools/base.nix
    ./apps/tools/compression.nix
    ./apps/tools/network.nix
    ./apps/tools/search.nix
    ./apps/tools/http.nix
    ./apps/web

    ./desktop
    ./dev
    ./security.nix

    # ./networking.nix
    ./workspace/fonts.nix

    ./apps/tools/cmix.nix
  ];
}
