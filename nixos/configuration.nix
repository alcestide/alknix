{ pkgs, lib, inputs, ... }:

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

environment.systemPackages = with pkgs; [
    gcc
	git
	htop
	ntfs3g
  	vim
	mpv
   	waybar
	tokyonight-gtk-theme
	sassc
	gtk-engine-murrine
	gnome-themes-extra
	libsForQt5.qt5.qtgraphicaleffects
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [
                "electron-24.8.6"
              ];
  nixpkgs.config.allowUnfree = true;
  nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 1d"; }; 
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  /*
  environment.sessionVariables = rec {
  	HYPRSHOT_DIR= "$HOME/Pictures/Screenshots";
	};
*/
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
