{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      btop
      neofetch
    ];
  };
}
