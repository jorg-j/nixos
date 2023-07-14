args@{ config, pkgs, lib, ... }:
let
    user = "jack";

    machine1_name = "pop-os";
    machine1_id = "RLA44QX-QSJCR7D-FEJ562P-A443ZN5-TETSA3X-VY6SVUO-RHLRXWS-PLNPLAV";

    machine2_name = "nas";
    machine2_id = "TOHCWTZ-SP64XIM-V4CZ537-YQTDRC2-6D6JOVT-QHQQQ5J-H6HZK3G-JMHEPAN";

in
{
  imports = [
    (import ./syncthing.nix (args // { 
      user = user;
      machine1_name = machine1_name;
      machine1_id = machine1_id;
      machine2_name = machine2_name;
      machine2_id = machine2_id;
      
       }))
  ];



 }