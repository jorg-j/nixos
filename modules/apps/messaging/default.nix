{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs;
    [
      # telegram-desktop # Telegram
      tdesktop
      discord
    ];
  };
}