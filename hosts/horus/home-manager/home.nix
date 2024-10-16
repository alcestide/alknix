{pkgs,config,inputs,username,... }:

{

  imports = [
    ./dunst/dunst.nix
    ./gtk.nix
    ./packages.nix
    ./programs.nix
    ./hypr/hypr.nix
    ];

    home = {
      username = "alcestide";
      homeDirectory = "/home/alcestide";
      sessionVariables = { 
      VISUAL="nvim";
      HYPRSHOT_DIR="/home/alcestide/Pictures/Screenshots";
      };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style = {
          name = "gtk2";
          package = pkgs.libsForQt5.breeze-qt5;
        };
      };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
