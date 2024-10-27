{ config
, pkgs
, lib
, ...
}: {
  home-manager.users.jack.programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        padding = {
          x = 4;
          y = 4;
        };
        decorations = "full";
      };

      shell.program = "${pkgs.zsh}/bin/zsh";

      cursor.style = "Underline";

      live_config_reload = true;
      colors = {
        primary = {
          background = "#282828";
          # soft contrast background = = "#32302f";
          foreground = "#ebdbb2";
        };
        normal = {


          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
      };
    };
  };
}
