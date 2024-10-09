{pkgs, ...}:
{

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.systemd-boot.consoleMode = "max"; 
  boot.loader.grub.font = 22;
}
