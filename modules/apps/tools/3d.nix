{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    openscad
  ];
}
