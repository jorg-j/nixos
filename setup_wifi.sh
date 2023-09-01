

wifi_conf() {
    read -r -p "SSID: " SSID
    read -r -p "psk: " PSK
    read -r -p "hostname: " HOSTN
cat << EOF > /etc/nixos/wifi.nix
{ config, pkgs, lib, ... }:

let
  SSID = "$SSID";
  SSIDpassword = "$PSK";
  interface = "wlan0";
  hostname = "$HOSTN";
in
{
networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."|{SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };
}
EOF

sed -i 's/|/\$/g' /etc/nixos/wifi.nix
}

wifi_conf()