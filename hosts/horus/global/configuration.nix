{ pkgs, host, username, lib, inputs, outputs, system, nixvim,... }:

# Nixvim Configuration and Set-up

let
	nixvim-config = import ./nixvim/config;
alknixvim = nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
	inherit pkgs;
	module = nixvim-config;};
in

{
  imports =
    [ 
        ./bootloader.nix
        ./networking.nix
        ./programs.nix
        ./services.nix
        ./fonts.nix
        ./hardware-configuration.nix
    ];
  fileSystems."/mnt/disk1" =
    { device = "/dev/disk/by-uuid/0889E01051FF80FB";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    }; 
  fileSystems."/mnt/disk2" =
    { device = "/dev/disk/by-uuid/7D7F42BD3E305E10";
      fsType = "ntfs-3g"; 
      options = [ "rw" "nofail" "uid=1000"];
    };

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
environment.shells = with pkgs; [ zsh ];
environment.systemPackages = [
    alknixvim
    pkgs.gcc
	pkgs.git
    pkgs.htop
	pkgs.ntfs3g
  	pkgs.vim
    pkgs.mpv
    pkgs.rclone
   	pkgs.waybar
    pkgs.networkmanagerapplet
    pkgs.gnome-themes-extra
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
    pkgs.libsForQt5.qt5.qtgraphicaleffects
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
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = ["electron-24.8.6"];
  nixpkgs.config.allowUnfree = true;
  nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 1d"; }; 
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  users.defaultUserShell = pkgs.zsh;
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  users.users.alcestide = {
    isNormalUser = true;
    description = "Angelo Panariti";
    extraGroups = [ "networkmanager" "wheel" "vboxusers"];
    packages = with pkgs; [
    ];
  };

  security.polkit.enable = true;
virtualisation.virtualbox.host.enable = true;
users.extraGroups.vboxusers.members = [ "alcestide" ];
virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ (pkgs.OVMF.override {
          secureBoot = true;
          httpSupport = true;
          tpmSupport = true;
        }).fd ];
      };
    };
  };
environment.sessionVariables = {
QT_STYLE_OVERRIDE = pkgs.catppuccin-qt5ct;
};

  programs.virt-manager.enable = true;
  system.stateVersion = "24.05"; 
}
