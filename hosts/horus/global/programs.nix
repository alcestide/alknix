{pkgs, lib, ...}:
{
  
programs = { 
  hyprland.enable = true;
  zsh.enable = true;
  wireshark.enable = true;
  wireshark.package = pkgs.wireshark;
  thunar.enable = true;
  thunar.plugins = with pkgs.xfce; [
    thunar-volman
    thunar-archive-plugin
    thunar-media-tags-plugin
    ];
  #neovim.enable = true;
  #neovim.defaultEditor = true;
  };
}
