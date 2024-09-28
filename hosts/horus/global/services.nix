{pkgs, lib, username,...}:
{
  
  services = {
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = lib.mkForce "${import ../derivations/sddm-theme.nix { inherit pkgs; }}";
    displayManager.sddm.catppuccin.assertQt6Sddm = false;
    displayManager.defaultSession = "hyprland";
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
      user = username;
      dataDir = "/home/${username}/Documents";
      configDir = "/home/${username}//Documents/.config/syncthing";
    };

  };
}
