{ config, lib, pkgs, ... }:

{
  imports =
   [ 
      ./networking.nix
      ./services.nix
      ./virtualisation.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "Europe/Rome";

  fileSystems."/mnt/disk1" = {
		device = "/dev/disk/by-uuid/afb8223d-fd53-44cb-b3e7-0354fdb03d88";
		fsType = "ext4";
		options = [ "nofail"];
	};

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

  system.stateVersion = "24.05"; # Did you read the comment?
}


