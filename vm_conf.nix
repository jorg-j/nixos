# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      (import "${builtins.fetchurl https://gitlab.com/jorgensen-j/nixos/-/raw/main/vm-hardware-configuration.nix}")
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "jack";
    hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    htop
    todoist-electron # ToDoIst
    tdesktop         # Telegram
    obsidian         # Obsidian
    vscode           # Visual Studio Code
    # docker           # docker
    # virtualbox
    vlc              # VLC media
    libreoffice-qt   # Libre office
    hunspell         # Spell Check for Libre
    bitwarden        # Password Manager
    bitwarden-cli    # Password Manager
    zsh              # ZSH Shell
    vorta            # Vorta Backups
    python39Full     # Python 3.9
    poetry           # Poetry
    unzip            # Unzip
    realvnc-vnc-viewer
    sqlitebrowser
    discord
    
    (
      with import <nixpkgs> {};

      vim_configurable.customize {
        # Specifies the vim binary name
        # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
        # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
        name = "vim";
        vimrcConfig.customRC = ''
          syntax on
          syntax enable
          set backupdir=/tmp      " save backup files (~) to /tmp
          set tabstop=4           " number of visual spaces per TAB
          set softtabstop=4       " number of spaces in tab when editing
          set expandtab           " tabs are spaces
          filetype indent on      " load filetype-specific indent files
          filetype on             " Enable file type detection
          set number              " show line numbers
          set showcmd             " show command in bottom bar
          set cursorline          " highlight current line
          set wildmenu            " visual autocomplete for command menu
          set lazyredraw          " redraw only when we need to.
          set showmatch           " highlight matching [{()}]
          set incsearch           " search as characters are entered
          set hlsearch            " highlight matches
          colorscheme industry
          set backspace=indent,eol,start " backspace over everything in insert mode
        '';
      }
    )
 ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?



}
