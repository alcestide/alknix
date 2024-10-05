{pkgs, lib, ...}:
{
  
programs = { 
  hyprland.enable = true;
  zsh.enable = true;
  wireshark.enable = true;
  wireshark.package = pkgs.wireshark;
  #neovim.enable = true;
  #neovim.defaultEditor = true;
  };
}
