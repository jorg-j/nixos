{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fd
    findutils
    rdfind
    ack
    ripgrep
    silver-searcher
    fzf
    skim
    fzy
    hstr
    rename
  ];
}
