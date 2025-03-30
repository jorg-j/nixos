{pkgs, ...}: {
  users.users.jack.packages = with pkgs; [factorio];
  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = "jorgo1";
      token = "ffdf6a6cbda6d613d8bf21ecfe7580";
    };
  };
}
