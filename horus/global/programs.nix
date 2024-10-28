{pkgs, lib, ...}:
{
  
  programs = { 
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
      enableSSHSupport = true;
    };
    zsh.enable = true;
    wireshark.enable = true;
    wireshark.package = pkgs.wireshark;
    thunar.enable = true;
      thunar.plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];

  direnv = {
  enable = true;
  nix-direnv.enable = true;
};
  
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      };
    };
}
