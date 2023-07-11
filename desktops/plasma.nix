{ config, pkgs, lib, ... }:

{# Enable Plasma

services.xserver.enable = true;
services.xserver.displayManager.sddm = {
        enable = true;
        backgroundImage = pkgs.fetchurl {
            url = "https://cdn.donmai.us/original/d3/1b/__manjuu_prinz_eugen_roon_bismarck_friedrich_der_grosse_and_3_more_azur_lane_drawn_by_zaphn__d31bf4ac564d60f8787818842c369e7f.jpg";
            sha256 = "sha256-likoJuEaGzGH0RqjPsBE9o5ATwgnOo97PREh3oZBax8=";
          };
};
services.xserver.desktopManager.plasma5enable = true;
        

}

