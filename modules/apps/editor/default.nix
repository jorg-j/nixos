{ config
, pkgs
, vars
, lib
, ...
}:
#  {

#   imports = [
#     ./vim.nix
#   ];

#   environment.systemPackages = [
#     pkgs.fuse
#   ];


lib.mkMerge [{
  # main config options
}
(lib.mkIf config.networking.hostName == "nuc" {
  # ...
})
(lib.mkIf config.networking.hostName != "nuc" {
  imports = [
    ./vim.nix
  ];

  environment.systemPackages = [
    pkgs.fuse
  ];
})]


  # imports =
  #   if config.networking.hostName == "nuc" then [
  #     # ./logseq.nix
  #     ./office.nix
  #     ./vim.nix
  #     # ./neovim.nix
  #     ./vscode.nix
  #   ]
  #   else [
  #     ./vim.nix
  #   ];


  # environment.systemPackages =
  #   if config.networking.hostName == "nuc" then [
  #     pkgs.fuse

  #     pkgs.arduino
  #     pkgs.logseq
  #   ]
  #   else [
  #     pkgs.fuse
  #   ];

# }
