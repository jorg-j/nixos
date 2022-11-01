{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      hunspell
      hunspellDicts.en_US-large
      libreoffice-fresh

      todoist-electron     # ToDoIst
      obsidian             # Obsidian
    ];
  };
}