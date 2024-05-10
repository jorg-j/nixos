{ config
, pkgs
, vars
, lib
, ...
}:


{
  options.our.roles.hpserver = {
    enable = mkEnableOption "hpserver";
  };

  imports = [
    ./vim.nix
  ];

  config = mkIf options.our.roles.hpserver.enable {
    environment.systemPackages = [
      pkgs.fuse
    ];
  };






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

}
