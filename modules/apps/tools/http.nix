{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    aria2
    curl
    wget
    httpie
  ];
}
