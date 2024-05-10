{ config
, pkgs
, vars
, ...
}:
#  {

#   imports = [
#     ./vim.nix
#   ];

#   environment.systemPackages = [
#     pkgs.fuse
#   ];


mkMerge [{
  # main config options
}
(mkIf config.networking.hostName == "nuc" {
  # ...
})
(mkIf config.networking.hostName != "nuc" {
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
