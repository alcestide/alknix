{pkgs,lib,host,...}:

{
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking.hostName = host;
  networking.networkmanager.enable = true;
  networking.interfaces.enp6s0.useDHCP = false;
  networking.interfaces.enp6s0.ipv4.addresses = [ {
		address = "192.168.1.10";
		prefixLength = 24;
              } ];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = ["192.168.1.11"];
  networking.firewall.enable = false;
   networking.firewall.checkReversePath = "loose";
   networking.firewall.allowedTCPPorts = [ 22 47 53 80 1723 5201 8384 8096 32400];
   networking.firewall.allowedUDPPorts = [ 47 1723 53 51820 ];
}
