{inputs,username,... }:

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
    };

  qt.enable = true;
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
