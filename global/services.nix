{username,...}:
{

  services = {

    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    xserver.displayManager.gdm.wayland = true;

    pcscd.enable = true;
    openssh.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = false;
      alsa.support32Bit = false;
      pulse.enable = true;
    };

    gvfs.enable = true;
    navidrome = {
      enable = false;
      settings = { MusicFolder = "/mnt/disk1/Music";};
      openFirewall = true;
    };
    tumbler.enable = true;
    syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/Documents";
      configDir = "/home/${username}//Documents/.config/syncthing";
    };
    jellyfin = {
      enable = true;
      openFirewall = true;
    };

    plex = {
      enable = true;
      openFirewall = true;
    };
    sunshine = {
      enable = false;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
    avahi = {
    enable = false;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };

  vsftpd = {
    enable = true;
    writeEnable = true;
    localUsers = true;
    userlist = [ "alcestide" ];
    userlistEnable = true;
    extraConfig = ''
      pasv_enable=Yes
      pasv_min_port=51000
      pasv_max_port=51999
    '';
  };
  };
}
