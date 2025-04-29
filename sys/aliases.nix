{
  environment.shellAliases = {
    config = "cd ~/Documents/20-29_Technology/20_Infrastructure/20.03_NixOs/nixos";
    build = "sudo nixos-rebuild switch --keep-going; notify-send 'Build Complete'";
    check = "nix-instantiate '<nixpkgs/nixos>' -A system";
    # flakebuild = "sudo nixos-rebuild --flake .#Desktop switch";

    localtest = "sudo nixos-rebuild test -I nixos-config=./hosts/nuc.nix";
    localvm = "rm nuc.qcow2; sudo nixos-rebuild build-vm --fast -I nixos-config=./hosts/nuc.nix && ./result/bin/run-nuc-vm";

    bootbuild = "sudo nixos-rebuild boot --keep-going";
    sync = "cd /etc/nixos && sudo git stash && sudo git pull --rebase";
    rollback = "sudo nixos-rebuild switch --rollback";
    clean = "sudo nix-collect-garbage --delete-older-than 30d";
    autoclean = "sudo nix-env --delete-generations old";
    restart = "sudo restart -h now";

    closure_build = "cd /etc/nixos/closures && sudo nix-build --attr system $1";
    closure_deploy = "cd /etc/nixos/closures && sudo ./result/bin/switch-to-configuration switch";
    # closure_full = "cd /etc/nixos/closure_files && sudo nix-build --attr system $1 && sudo ./result/bin/switch-to-configuration switch";

    format = "nixpkgs-fmt";

    stable = "git tag -d stable; git tag -d origin stable; git tag stable";
    pushtags = "git push --tags";

    mc = "EDITOR=vim mc";

    s = "sudo";
    ss = "sudo systemctl";

    log = "sudo journalctl --output cat -u";
    log-previous-boot = "sudo journalctl --boot=-1";

    pgrep = "pgrep --full";
    pkill = "pkill --full";
    l = "ls -lahXF --group-directories-first";

    r = "rsync -ra --info=progress2";
    rs = "rsync -avP";
    ns = "notify-send";

    g = "git";
    gs = "git status";

    ga = "git add";
    gau = "git add -u";

    gco = "git checkout";
    gc = "git commit -m";
    gca = "git commit --all --message";

    # gs = "git status --short";
    gd = "git diff";
    gdc = "git diff --cached";
    gfr = "git pull --rebase";
    gp = "git push";
    gso = "git log -p --all --source -S ";

    fd = "fd --hidden --exclude .git";

    hg = "history | grep";

    # KDE

    # Fix KDE screen issue
    kscreen = "pushd /home/jack/.local/share > /dev/null && rm -r kscreen && popd > /dev/null";

    # Plasma Restart Desktop
    plasmakill = "pkill plasmashell && sleep 3 && kstart plasmashell";

    # ---

    grab-display = "export DISPLAY = ':0.0'";

    hd-wipe-user-packages = "nix-env -e '*'";

    hd-gc = "sudo nix-collect-garbage --delete-older-than 30d";
    hd-inspect-store = "nix path-info -rSh /run/current-system | sort -k2h ";

    container = "curl -s https://raw.githubusercontent.com/jorg-j/Docker_Dev_Env/main/setup.sh | bash";

    # Surface Based Alias's
    # Here to fix surface /boot when /boot goes read only
    # surface-boot = "sudo umount /boot && sudo fsck /dev/nvme0n1p1 && sudo mount /dev/nvme0n1p1 /boot";
    # pen = "sudo systemctl restart iptsd.service";

    # Set monitors on desktop
    mon = "xrandr --output DP-2 --auto --right-of HDMI-1";

    # Check the content of an app i3
    xwin = "xprop | grep WM_CLASS";

    flash_keyboard = "wget https://oryx.zsa.io/3ya9r/latest/binary -O binary.bin && wally-cli binary.bin && rm binary.bin";
    flash_keyboard1 = "wget https://oryx.zsa.io/oq5mG/latest/binary -O binary.bin && wally-cli binary.bin && rm binary.bin";

    # Setup python nix shell
    pydev = "cp /home/jack/Documents/20-29_Technology/20_Infrastructure/20.03_NixOS/nixos/modules/dev/python/py_shell.nix ./shell.nix";

    # sync obsidian
    obsync = "pushd /home/jack/Documents/10-19_Books/13_Obsidian_Vaults > /dev/null && bash sync.sh && popd > /dev/null";

    n = "bash /home/jack/Documents/20-29_Technology/20_Infrastructure/20.03_NixOS/nixos/sys/command_script/commands.sh";

    hyperconfig = "vim ~/.config/hypr/hyprland.conf"; # Hyperland Config
    i3config = "vim ~/.config/i3/config"; # i3 config

    hyprland_setup = "bash /home/jack/Documents/20-29_Technology/20_Infrastructure/20.03_NixOS/nixos/sys/command_script/hyprland_setup.sh";

    # duckypad
    ducky = "sudo DUCKYPAD_UI_SCALE=2 duckypad";

    # Home Manager Service Journal
    homej = "journalctl -u home-manager-jack.service --since today";
  };
}
