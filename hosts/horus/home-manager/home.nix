{pkgs,config,inputs,username,... }:

{

  imports = [
    ./dunst/dunst.nix
    #./nixvim.nix
    ./gtk.nix
    ./packages.nix
    ./programs.nix
    ];

    home.username = "alcestide";
    home.homeDirectory = "/home/alcestide";
    home.sessionVariables = { 
      HYPRSHOT_DIR="/home/alcestide/Pictures/Screenshots";
      NICOTINE_LIBADWAITA=1;
    };


    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "catppuccin";
  };
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
