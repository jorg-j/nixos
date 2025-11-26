{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ngrok ];

 systemd.services.ngrok = {
    enable = true;
    description = "ngrok tunnel service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.ngrok}/bin/ngrok http 5678";
      Restart = "always";
      RestartSec = 3;
    };
    
    # Optional: Set auth token via environment
    environment = {
      NGROK_AUTHTOKEN = "3623BfaDjMDk3d1D0cyr9y9DIe4_5SiHJQ4jppuTntqFav72U";
    };
  };


#   # Enable user services
#   systemd.user.services.ngrok = {
#     description = "ngrok tunnel service";
#     after = [ "network.target" ];
#     wantedBy = [ "default.target" ];
    
#     serviceConfig = {
#       Type = "simple";
#       ExecStart = "${pkgs.ngrok}/bin/ngrok start --all";
#       ExecReload = "/bin/kill -HUP $MAINPID";
#       Restart = "always";
#       RestartSec = 3;
#     };

#     # Set environment variables
#     environment = {
#       NGROK_CONFIG = "%h/.config/ngrok/ngrok.yml";
#     };

#     # Create config directory as part of service setup
#     path = [ pkgs.ngrok ];
#     preStart = ''
#       mkdir -p ~/.config/ngrok
#       if [ ! -f ~/.config/ngrok/ngrok.yml ]; then
#         cat > ~/.config/ngrok/ngrok.yml << 'EOF'
#     version: "3"
#     agent:
#         authtoken: 3623BfaDjMDk3d1D0cyr9y9DIe4_5SiHJQ4jppuTntqFav72U
#     tunnels:
#       n8n:
#         addr: 5678
#         proto: http
#     EOF
#       fi
#     '';
#   };
}