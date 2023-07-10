{ pkgs, toRelativePath, unstable, ... }@args:

with builtins;
{
  home-manager.useUserPackages = true;
  home-manager.users.pearman = { config, ... }: {
    nixpkgs.config = {
      allowUnfree = true;
    };

    # Allow fractional scaling in wayland - produces blurry image
    # dconf.settings = {
    #   "org/gnome/mutter" = {
    #     experimental-features = [ "scale-monitor-framebuffer" ];
    #   };
    # };

    xresources.properties = {
      "Xcursor.size" = 64;
    };

    programs = {
    #   vscode = import ./vscode.nix args;
    autorandr.enable = true;
      git = {
        enable = true;
        userName = "jorg-j";
        userEmail = "jorgensen.server@gmail.com";
      };


      zsh = {
        enable = true;
        enableCompletion = true;
        plugins = [
          {
            name = "zsh-nix-shell";
            file = "nix-shell.plugin.zsh";
            src = pkgs.fetchFromGitHub {
              owner = "chisui";
              repo = "zsh-nix-shell";
              rev = "v0.1.0";
              sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
            };
          }
        ];
        prezto = {
          enable = true;
          prompt.theme = "steeef";
        };
      };
    };

    # xdg.configFile = {
    #   "nixpkgs/config.nix".source = toRelativePath "configs/nixpkgs.nix";
    # };

    # home.file = {
    #   ".vimrc".source = toRelativePath "configs/.vimrc";
    # };

    home = {
      # We will manage keyboard in global settings
      keyboard = null;

      packages = with pkgs; [
        # CLI
        unzip
        bitwarden-cli
        niv

        # GUI
        firefox
        vlc
        gnome.seahorse
        gparted
        gnome.dconf-editor

        # Electron evil apps
        atom
        bitwarden
        spotify
        unstable.pkgs.discord
      ];
    };
  };
}
