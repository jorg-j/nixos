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

    mlocate
    plocate
  ];
  services.locate.enable = true;
  services.locate.package = pkgs.mlocate;
}
