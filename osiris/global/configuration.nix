{pkgs, inputs, config, lib, ... }:

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
  boot.initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
  time.timeZone = "Europe/Rome";

  fileSystems."/mnt/disk1" = {
		device = "/dev/disk/by-uuid/59673526-e675-49d7-bf41-866becf5cc4c";
		fsType = "ext4";
		options = [ "nofail"];
	};

  users.users.alcestide = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
     ];
   };

age.secrets.cloudflare = {
        file = ../secrets/cloudflare.age;
        owner = "alcestide";
        group = "users";
        };

  environment.systemPackages = with pkgs; [
     inputs.nixvim.packages."x86_64-linux".default
     inputs.agenix.packages."x86_64-linux".default
     vim 
     wget
     xclip
     wireguard-tools
     smartmontools
  ];


  environment.interactiveShellInit = ''
  	alias rb='sudo nixos-rebuild switch'
	'';
					
  nix.settings.experimental-features = ["nix-command" "flakes"];
  #nixpkgs.config.allowUnfree = true;
  systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce false;
	
  system.stateVersion = "24.05"; # Did you read the comment?
}


