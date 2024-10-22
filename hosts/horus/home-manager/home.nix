{pkgs,config,inputs,username,... }:

{

  imports = [
    ./dunst/dunst.nix
    ./gtk.nix
    ./qt.nix
    ./packages.nix
    ./programs.nix
    ./hypr/hypr.nix
    ];

    home = {
      username = "alcestide";
      homeDirectory = "/home/alcestide";
      sessionVariables = { 
      VISUAL="nvim";
      HYPRSHOT_DIR="$HOME/Pictures/Screenshots";
      HORUS="/etc/nixos/hosts/horus";
      DOCS="$HOME/Documents/";
      CODE="$HOME/Documents/Programming";
      };
    };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
