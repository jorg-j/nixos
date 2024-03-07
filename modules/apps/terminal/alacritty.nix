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
        decorations = "none";
      };

      shell.program = "${pkgs.zsh}/bin/zsh";

      cursor.style = "Underline";

      live_config_reload = true;
    };
  };
}
