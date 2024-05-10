{ config
, pkgs
, vars
, ...
}: {

  imports =
    if config.networking.hostName == "nuc" then [
      # ./logseq.nix
      ./office.nix
      ./vim.nix
      # ./neovim.nix
      ./vscode.nix
    ]
    else [
      ./vim.nix
    ];


  environment.systemPackages =
    if config.networking.hostName == "nuc" then [
      pkgs.fuse

      pkgs.arduino
      pkgs.logseq
    ]
    else [
      pkgs.fuse
    ];

}
