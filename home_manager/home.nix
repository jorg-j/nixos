{
  config,
  pkgs,
  ...
}: {

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "23.05";

  # Set ZSH with theme and plugins available
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["docker-compose" "docker" "git"];
      theme = "agnoster";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
    envExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
    '';
  };

  home.file = {
    ".ssh/config" = {source = "/etc/nixos/home_manager/files/ssh_config";};                              # ssh config
    ".config/nixpkgs/config.nix" = {source = "/etc/nixos/home_manager/files/nixpkgs_config.nix";};       # nixpkgs config
    #".config/hypr/waybar/config" = {source = "/etc/nixos/home_manager/files/waybarconfig";};             # Hyperland wayconf
    #".config/hypr/waybar/style.css" = {source = "/etc/nixos/home_manager/files/waybar.css";};            # Hyperland waycss
    ".config/hypr/swaync.json" = {source = "/etc/nixos/home_manager/files/swaync.json";};                # Hyperland sway
    ".config/hypr/wallpapers/wallpaper.png" = {source = "/etc/nixos/home_manager/files/wallpaper.png";}; # Hyperland wallp
    ".config/hypr/hyprlock.conf" = {source = "/etc/nixos/home_manager/files/hyprlock.conf";};            # Hyperland lockscreen
    ".config/hypr/hypridle.conf" = {source = "/etc/nixos/home_manager/files/hypridle.conf";};            # Hyperland lockscreen
    
  };

   home.packages = with pkgs; [
    dconf
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "orchis-theme";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

  };
}
