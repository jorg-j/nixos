{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      tdesktop # Telegram
      discord
    ];
  };
}