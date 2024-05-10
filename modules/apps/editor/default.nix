{ config
, pkgs
, vars
, ...
}: {

  imports =
    if networking.hostName == "nuc" then [
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
    if networking.hostName == "nuc" then [
      pkgs.fuse

      pkgs.arduino
      pkgs.logseq
    ]
    else [
      pkgs.fuse
    ];

}
