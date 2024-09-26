{lib, ...}:

{
  networking.hostName = "alknix"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;
}
