{ config, pkgs, ... }:

{
  # Enable WireGuard
  networking.wireguard.interfaces = {
    wg0 = {
      # Server configuration
      ips = [ "10.0.0.1/24" ];
      listenPort = 51820;

      # Server private key - generate with: wg genkey > /etc/wireguard/private.key
      privateKeyFile = "/etc/wireguard/private.key";

      # Enable IP forwarding
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
      '';

      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
      '';

      # Client configurations
      peers = [
        {
          # Client 1
          publicKey = "JACKIPHONE_PUBLIC_KEY";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          # Client 2  
	publicKey = "JACKMACBOOK_PUBLIC_KEY";
          allowedIPs = [ "10.0.0.3/32" ];
        }
      ];
    };
  };

  # Enable IP forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = true;

  # Open firewall port
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 51820 ];
    # Allow traffic from VPN to local network
    trustedInterfaces = [ "wg0" ];
    checkReversePath = false; # Important for VPN routing
  };

}
