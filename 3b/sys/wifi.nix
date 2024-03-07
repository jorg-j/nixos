{ config
, pkgs
, lib
, ...
}: {
  # === Setup Wifi ===
  # to generate passphrase
  # wpa_passphrase exampleSSID examplePassword
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = {
      zelda = {
        pskRaw = "1dfbc34490b8e2d7c426e97371edc8f1e0d995a5c50b39be059f0609dd0fd668";
      };
    };
  };
}
