{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-osd
    cosmic-term

    cosmic-comp
    cosmic-tasks
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-session
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-launcher
    cosmic-protocols
    cosmic-screenshot
    cosmic-applibrary
    cosmic-design-demo
    cosmic-notifications
    cosmic-settings-daemon
    cosmic-workspaces-epoch
  ];
}
# https://nixos.wiki/wiki/COSMIC

