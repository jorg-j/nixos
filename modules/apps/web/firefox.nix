{ config, pkgs, lib, ... }:

{
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    MOZ_DBUS_REMOTE = "1";
  };

  home-manager.users.jack = {
    programs.browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };

    programs.firefox = {
      enable = true;

      profiles.default = {
        id = 0;

        settings = {
          "extensions.autoDisableScopes" = 0;

          "browser.search.defaultenginename" = "Google";
          "browser.search.selectedEngine" = "Google";
          "browser.urlbar.placeholderName" = "Google";
          "browser.search.region" = "AU";

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;
        };
      };
    };
  };
}
