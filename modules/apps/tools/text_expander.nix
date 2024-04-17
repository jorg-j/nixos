{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    espanso
  ];
}
