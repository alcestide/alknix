{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "osiris"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.interfaces.enp1s0.ipv4.addresses = [ {
		address = "192.168.1.11";
		prefixLength = 24;
	} ];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 4533 8384 ];
  time.timeZone = "Europe/Rome";

  fileSystems."/mnt/disk1" = {
		device = "/dev/disk/by-uuid/afb8223d-fd53-44cb-b3e7-0354fdb03d88";
		fsType = "ext4";
		options = [ "nofail"];
	};

  services.xserver.xkb.layout = "us";
  services.printing.enable = true;
  services.openssh.enable = true;
  users.users.alcestide = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
     ];
   };

  environment.systemPackages = with pkgs; [
     vim 
     wget
  ];

  services.navidrome = {
	enable = true;
	settings = { MusicFolder ="/mnt/disk1/Music";
		     Address = "0.0.0.0";};
	openFirewall = true;

};

  services.syncthing = {
	enable = true;
	dataDir = "/home/alcestide/Documents";
	configDir = "/home/alcestide/Documents/.config/syncthing";
	guiAddress = "0.0.0.0:8384";
	user = "alcestide";
	group = "wheel";
	openDefaultPorts = true;
};

  virtualisation.docker.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}


