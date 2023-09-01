{
  environment.shellAliases = {
    config = "sudo vim /etc/nixos/configuration.nix";
    build = "sudo nixos-rebuild switch --keep-going";
    bootbuild = "sudo nixos-rebuild boot --keep-going";
    sync = "cd /etc/nixos && sudo git stash && sudo git pull --rebase";
    rollback = "sudo nixos-rebuild switch --rollback";
    clean = "sudo nix-collect-garbage --delete-older-than 30d";
    autoclean = "sudo nix-env --delete-generations old";
    restart = "sudo restart -h now";

    s = "sudo";
    ss = "sudo systemctl";

    log = "sudo journalctl --output cat -u";
    log-previous-boot = "sudo journalctl --boot=-1";

    pgrep = "pgrep --full";
    pkill = "pkill --full";
    l = "ls -lahXF --group-directories-first";

    r = "rsync -ra --info=progress2";
    rs = "rsync -avP";

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
  };
}
