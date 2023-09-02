{ config, lib, pkgs, ... }:

# When updating go to the download url on line 
# Download the tar and run the below command to get the hash, will likely need opensll in a nix-shell first
# openssl dgst -sha256 -binary Downloads/obsidian-1.4.5.tar.gz | openssl base64 -A
# nixos-rebuild -I nixos-config=$(pwd)/hosts/desktop.nix test

let
  pname = "obsidian";
  version = "1.4.5";
  appname = "Obsidian";
  meta = with lib; {
    description = "A powerful knowledge base that works on top of a local folder of plain text Markdown files";
    homepage = "https://obsidian.md";
    downloadPage = "https://github.com/obsidianmd/obsidian-releases/releases";
    license = licenses.obsidian;
    maintainers = with maintainers; [ ];
  };

  filename = "obsidian-${version}.tar.gz";
  src = pkgs.fetchurl {
    url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v${version}/${filename}";
    sha256 = "sha256-Y/RlT+3xBbF9tjCbRQnQ+j8ogzLMfsQPnOdiCVj+NK0=";
  };

  icon = pkgs.fetchurl {
    url = "https://forum.obsidian.md/uploads/default/original/1X/bf119bd48f748f4fd2d65f2d1bb05d3c806883b5.png";
    sha256 = "18ylnbvxr6k4x44c4i1d55wxy2dq4fdppp43a4wl6h6zar0sc9s2";
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "obsidian";
    desktopName = "Obsidian";
    comment = "Knowledge base";
    icon = "obsidian";
    exec = "obsidian %u";
    categories = [ "Office" ];
    mimeTypes = [ "x-scheme-handler/obsidian" ];
  };

  obsidianPkg = pkgs.stdenv.mkDerivation {
    name = pname;
    version = version;
    src = src;
    nativeBuildInputs = [ pkgs.makeWrapper pkgs.graphicsmagick ];
    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      makeWrapper ${pkgs.electron}/bin/electron $out/bin/obsidian \
        --add-flags $out/share/obsidian/app.asar \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland}}"
      install -m 444 -D resources/app.asar $out/share/obsidian/app.asar
      install -m 444 -D resources/obsidian.asar $out/share/obsidian/obsidian.asar
      install -m 444 -D "${desktopItem}/share/applications/"* \
        -t $out/share/applications/
      for size in 16 24 32 48 64 128 256 512; do
        mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
        gm convert -resize "$size"x"$size" ${icon} $out/share/icons/hicolor/"$size"x"$size"/apps/obsidian.png
      done
      runHook postInstall
    '';

    passthru.updateScript = pkgs.writeScript "updater" ''
      #!/usr/bin/env nix-shell
      #!nix-shell -i bash -p curl jq common-updater-scripts
      set -eu -o pipefail
      latestVersion="$(curl -sS https://raw.githubusercontent.com/obsidianmd/obsidian-releases/master/desktop-releases.json | jq -r '.latestVersion')"
      update-source-version obsidian "$latestVersion"
    '';
  };
  # };

in
{
  environment.systemPackages = [ obsidianPkg ];

}
