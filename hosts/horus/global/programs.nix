{pkgs, lib, ...}:
{
  
  programs = { 
    zsh.enable = true;

    #hyprland = enable = true;

    wireshark.enable = true;
    wireshark.package = pkgs.wireshark;

    thunar.enable = true;
      thunar.plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
  ];
  
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      };
    };
}
