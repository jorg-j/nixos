{
  config,
  pkgs,
  vars,
  ...
}: {

  imports = if config.networking.hostname == "nuc" then [
    # ./logseq.nix
    ./office.nix
    ./vim.nix
    # ./neovim.nix
    ./vscode.nix
    # ./obsidian.nix # disabled in favor of flatpak
  ]
  else [
    ./vim.nix
  ];


  environment.systemPackages = if config.networking.hostname == "nuc" then [
    fuse

    arduino
    logseq
  ]
  else [
    fuse
  ];

}
