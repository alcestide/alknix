{lib,...}:
{

  imports = [

    ./programs.nix
    ./packages.nix

    ./themes/gtk.nix
    ./themes/qt.nix

    ./hypr/hypr.nix
    ./hypr/dunst/dunst.nix


    ./shell/zsh.nix
    ./shell/htop.nix
    ./shell/tmux.nix
    ./shell/yazi.nix
    ./shell/terminals.nix

    ];
    home = {
      username = "alcestide";
      homeDirectory = "/home/alcestide";
      sessionVariables = {
      VISUAL="nvim";
      HYPRSHOT_DIR="$HOME/Pictures/Screenshots";
      HORUS="/etc/nixos/";
      DOCS="$HOME/Documents/";
      CODE="$HOME/Documents/Programming";
      };
    };
nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
