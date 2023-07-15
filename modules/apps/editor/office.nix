{ pkgs, ... }:

{
  home-manager.users.jack = {
    home.packages = with pkgs; 
    [ 
      abiword
      gnumeric
      obsidian
      todoist-electron

      hunspell
      hunspellDicts.en_US-large
      libreoffice-fresh

    ];
  };
}
