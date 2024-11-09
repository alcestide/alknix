{pkgs, config,self, inputs, ... }:

{
  imports = [
        ./age.nix
        ./bootloader.nix
        ./disks.nix
        ./networking.nix
        ./virtualisation.nix
        ./programs.nix
        ./services.nix
        ./fonts.nix
        ./hardware-configuration.nix
      ];

    catppuccin.flavor = "mocha";
    catppuccin.enable = true;

    time.timeZone = "Europe/Rome";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  powerManagement.enable = true;
  systemd.sleep.extraConfig = ''
    AllowHibernation=no
    AllowHybridSleep=no
    SuspendState=mem
  '';
  services.logind.extraConfig = ''
    IdleAction=suspend
    IdelActionSec=1min
  '';

environment.sessionVariables = {
  EDITOR = "nvim";
  QT_STYLE_OVERRIDE = pkgs.dracula-theme;
};

environment.systemPackages = [
  inputs.nixvim.packages."x86_64-linux".default
  inputs.agenix.packages."x86_64-linux".default
  self.inputs.nix-alien.packages."x86_64-linux".nix-alien
  pkgs.gcc
  pkgs.gparted
  pkgs.man-pages
  pkgs.glibc
  pkgs.git
  pkgs.ntfs3g
  pkgs.xarchiver
  pkgs.vim
  pkgs.mpv
  pkgs.ffmpeg
  pkgs.ffmpegthumbnailer
  pkgs.kdePackages.ffmpegthumbs
  pkgs.rclone
  pkgs.waybar
  pkgs.wl-clipboard
  pkgs.networkmanagerapplet
  pkgs.gnome-themes-extra
  pkgs.libsForQt5.qtstyleplugin-kvantum
  pkgs.libsForQt5.qt5ct
  pkgs.libsForQt5.qt5.qtgraphicaleffects
  pkgs.kdePackages.qtwayland
  pkgs.kdePackages.qtwayland
  pkgs.kdePackages.kdegraphics-thumbnailers
  pkgs.libsForQt5.kdegraphics-thumbnailers
  pkgs.kdePackages.kio-extras-kf5
  pkgs.kdePackages.kio-extras
  pkgs.kdePackages.kio-fuse
  pkgs.dolphin
  pkgs.libsForQt5.kimageformats
  pkgs.kdePackages.qtimageformats
  pkgs.kdePackages.qtimageformats
  pkgs.nodePackages.dockerfile-language-server-nodejs
  pkgs.python3Packages.python-lsp-server
  pkgs.nodePackages.yaml-language-server
  pkgs.nodePackages.vim-language-server

  # Wine
  # support both 32- and 64-bit applications
  pkgs.wineWowPackages.stable
  # support 32-bit only
  pkgs.wine
  # support 64-bit only
  (pkgs.wine.override { wineBuild = "wine64"; })
  # support 64-bit only
  pkgs.wine64
  # pkgs.wine-staging (version with experimental features)
  pkgs.wineWowPackages.staging
  # pkgs.winetricks (all versions)
  pkgs.winetricks
  # native wayland support (unstable)
  pkgs.wineWowPackages.waylandFull
  pkgs.wine-staging

  # Proton Utils
  pkgs.protontricks
  pkgs.protonup-qt
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = ["electron-24.8.6"];
  nixpkgs.config.allowUnfree = true;
  nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 1d"; }; 

  security.rtkit.enable = true;
  security.polkit.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;

  xdg.mime.enable = true;
  xdg.mime.addedAssociations = {
    "inode/directory" = ["dolphin.desktop"];
  };

    xdg.portal = {
      enable = true;
      config = {common = {default="hyprland";};};
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-hyprland ];
    };

  users.defaultUserShell = pkgs.zsh;
  users.users.alcestide = {
    isNormalUser = true;
    description = "Angelo Panariti";
    extraGroups = [ "networkmanager" "wheel" "vboxusers"];
    packages = with pkgs; [
    ];
  };

  system.stateVersion = "24.05";
}