{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [ngrok];

  systemd.services.ngrok = {
    enable = true;
    description = "ngrok tunnel service";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.ngrok}/bin/ngrok http 5678";
      Restart = "always";
      RestartSec = 3;
    };

    # Optional: Set auth token via environment
    environment = {
      NGROK_AUTHTOKEN = "";
    };
  };
}
