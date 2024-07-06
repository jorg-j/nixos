{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pkgs.ffmpeg-full
    pkgs.ffmpegthumbnailer
    pkgs.imagemagickBig
  ];
}
