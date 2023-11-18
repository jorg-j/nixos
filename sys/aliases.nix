{
  environment.shellAliases = {
    config = "sudo vim /etc/nixos/configuration.nix";
    build = "sudo nixos-rebuild switch --keep-going";
    # flakebuild = "sudo nixos-rebuild --flake .#Desktop switch";

    localtest = "sudo nixos-rebuild test -I nixos-config=./hosts/nuc.nix";
    localvm = "rm nuc.qcow2; sudo nixos-rebuild build-vm --fast -I nixos-config=./hosts/nuc.nix && ./result/bin/run-nuc-vm";

    bootbuild = "sudo nixos-rebuild boot --keep-going";
    sync = "cd /etc/nixos && sudo git stash && sudo git pull --rebase";
    rollback = "sudo nixos-rebuild switch --rollback";
    clean = "sudo nix-collect-garbage --delete-older-than 30d";
    autoclean = "sudo nix-env --delete-generations old";
    restart = "sudo restart -h now";


    closure_build = "cd /etc/nixos/closure_files && sudo nix-build --attr system $1";
    closure_deploy = "cd /etc/nixos/closure_files && sudo ./result/bin/switch-to-configuration switch";
    closure_full = "cd /etc/nixos/closure_files && sudo nix-build --attr system $1 && sudo ./result/bin/switch-to-configuration switch";

    build_surface = "nixos-rebuild --target-host jack@192.168.1.148 --use-remote-sudo switch -I nixos-config=/etc/nixos/hosts/surface.nix";
    build_rpi3 = "nixos-rebuild --target-host jack@192.168.1.2 --use-remote-sudo switch -I nixos-config=/etc/nixos/hosts/rpi3.nix";

    format = "nixpkgs-fmt";

    stable = "git tag -d stable; git tag -d origin stable; git tag stable";
    pushtags = "git push --tags";

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

    ga = "git add";
    gau = "git add -u";

    gco = "git checkout";
    gc = "git commit -m";
    gca = "git commit --all --message";

    gs = "git status --short";
    gd = "git diff";
    gdc = "git diff --cached";
    gfr = "git pull --rebase";
    gp = "git push";
    gso = "git log -p --all --source -S ";

    fd = "fd --hidden --exclude .git";

    hg = "history | grep";

    grab-display = "export DISPLAY = ':0.0'";

    hd-wipe-user-packages = "nix-env -e '*'";

    hd-gc = "sudo nix-collect-garbage --delete-older-than 30d";
    hd-inspect-store = "nix path-info -rSh /run/current-system | sort -k2h ";

    container = "curl -s https://raw.githubusercontent.com/jorg-j/Docker_Dev_Env/main/setup.sh | bash";

    # Surface Based Alias's
    # Here to fix surface /boot when /boot goes read only
    surface-boot = "sudo umount /boot && sudo fsck /dev/nvme0n1p1 && sudo mount /dev/nvme0n1p1 /boot";
    pen = "sudo systemctl restart iptsd.service";

    # Set monitors on desktop
    mon = "xrandr --output DP-2 --auto --right-of HDMI-1";

    # Check the content of an app i3
    xwin = "xprop | grep WM_CLASS";

    # Mount drives i3
    # Note if removing also remove from home_manager home.nix
    mounter = "bash ~/.mnti3/mounter";
    unmounter = "bash ~/.mnti3/unmounter";

    flash_keyboard = "wget https://oryx.zsa.io/3ya9r/latest/binary -O binary.bin && wally-cli binary.bin && rm binary.bin";
    flash_keyboard1 = "wget https://oryx.zsa.io/oq5mG/latest/binary -O binary.bin && wally-cli binary.bin && rm binary.bin";

    # Setup python nix shell
    pydev = "cp /etc/nixos/modules/dev/python/py_shell.nix ./shell.nix";

    # sync obsidian
    obsync = "cd /home/jack/Documents/10-19_Books_Documentation/13_Obsidian_Vaults && bash sync.sh";
  };
}
