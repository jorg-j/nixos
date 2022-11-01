{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      x11vnc
      realvnc-vnc-viewer   # VNC viewer
      tigervnc
    ];
  };
}