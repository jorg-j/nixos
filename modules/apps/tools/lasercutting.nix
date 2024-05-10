{pkgs, ...}: {
  environment.systemPackages = if config.networking.hostName == "nuc" then [
    pkgs.lightburn
  ]
  else [];
  
}
