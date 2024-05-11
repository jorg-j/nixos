{ pkgs
, lib
, config
, ...
}:

with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in
{
  config = {
    environment.systemPackages = with pkgs;
      if cfgNuc.enable then
        [
          ffmpeg-full
          ffmpegthumbnailer
          imagemagickBig

          kdenlive
        ]
      else if cfgHP.enable then
        [
          ffmpeg-full
          ffmpegthumbnailer
        ]
      else
        [
          ffmpeg-full
          ffmpegthumbnailer
        ];

  };

}
