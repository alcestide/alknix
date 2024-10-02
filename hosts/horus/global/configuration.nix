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
   	pkgs.waybar
    pkgs.networkmanagerapplet
	pkgs.gnome-themes-extra
	pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.nodePackages.dockerfile-language-server-nodejs
    pkgs.python3Packages.python-lsp-server
    pkgs.nodePackages.yaml-language-server
    pkgs.nodePackages.vim-language-server
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = ["electron-24.8.6"];
  nixpkgs.config.allowUnfree = true;
  nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 1d"; }; 
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  users.defaultUserShell = pkgs.zsh;
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  users.users.alcestide = {
    isNormalUser = true;
    description = "Angelo Panariti";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  system.stateVersion = "24.05"; 
}
