{pkgs, lib, ...}:
{
  
  services = {

    xserver.enable = true;
    #xserver.desktopManager.gnome.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.setupScript = "xrandr --output DP-2 --rate 144";
    displayManager.sddm.theme = lib.mkForce "${import ../derivations/sddm-theme.nix { inherit pkgs; }}";
    displayManager.sddm.catppuccin.assertQt6Sddm = false;
    displayManager.defaultSession = "hyprland";
    #gnome.gnome-browser-connector.enable = true;
    #gnome.core-shell.enable = true;
    openssh.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    navidrome = {
      enable = false;
      settings = { MusicFolder = "/mnt/disk1/Music";};
      openFirewall = true;
    };
    syncthing = {
      enable = false;
      user = "alcestide";
      dataDir = "/home/alcestide/Documents";
      configDir = "/home/alcestide/Documents/.config/syncthing";
    };

  };
}
