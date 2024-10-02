{pkgs,config,inputs,username,... }:
{

  imports = [
    ];

    home.username = "alcestide";
    home.homeDirectory = "/home/alcestide";


  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
