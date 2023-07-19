{
  environment.shellAliases = {
    config = "sudo vim /etc/nixos/configuration.nix";
    build = "sudo nixos-rebuild switch --keep-going";
    sync = "cd /etc/nixos && sudo git stash && sudo git pull --rebase";
    rollback = "sudo nixos-rebuild switch --rollback";
    clean = "sudo nix-collect-garbage --delete-older-than 30d";
    autoclean = "sudo nix-env --delete-generations old";
    restart = "sudo restart -h now";
    pen = "sudo systemctl restart iptsd.service";

    # Here to fix surface /boot when /boot goes read only
    surface-boot = "sudo umount /boot && sudo fsck /dev/nvme0n1p1 && sudo mount /dev/nvme0n1p1 /boot";

    rebuild = "cd /etc/nixos && sudo git remote update && sudo git status -uno | grep -q 'Your branch is behind' && sudo git stash && sudo git pull --rebase && build && ns 'Build Complete'";
    
    closure_build = "cd /etc/nixos/closure_files && sudo nix-build --attr system $1";
    closure_deploy = "cd /etc/nixos/closure_files && sudo ./result/bin/switch-to-configuration switch";
    closure_full = "cd /etc/nixos/closure_files && sudo nix-build --attr system $1 && sudo ./result/bin/switch-to-configuration switch";


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
    gc = "git commit --message";
    gca = "git commit --all --message";

    gs = "git status --short";
    gd = "git diff";
    gdc = "git diff --cached";
    gfr = "git pull --rebase";
    gp = "git push";
    gso = "git log -p --all --source -S ";
    
    fd = "fd --hidden --exclude .git";

    grab-display = "export DISPLAY = ':0.0'";

    hd-wipe-user-packages = "nix-env -e '*'";

    hd-gc = "sudo nix-collect-garbage --delete-older-than 30d";
    hd-inspect-store = "nix path-info -rSh /run/current-system | sort -k2h ";

    container="curl -s https://raw.githubusercontent.com/jorg-j/Docker_Dev_Env/main/setup.sh | bash"

  };
}