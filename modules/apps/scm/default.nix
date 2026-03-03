{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gnupg
    sd
    git
  ];

  home-manager.users.jack = {
    programs.delta.enable = true;
    programs.delta.enableGitIntegration = true;
    programs.git = {
      enable = true;
    };

    home.packages = with pkgs; [delta];

    # home.file = {
    #   ".gitconfig" = { source = "${inputs.git-config}/gitconfig"; };
    #   ".gitignore" = { source = "${inputs.git-config}/gitignore"; };
    #   ".gitmessage" = { source = "${inputs.git-config}/gitmessage"; };
    # };
  };

  environment.etc."gitconfig".text = ''
    [user]
        name = jorg-j
        email = jorgensen.server@gmail.com
    [credential]
        helper = cache --timeout=3600
  '';
}
