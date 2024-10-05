{lib,host,...}:

{
  networking.hostName = host;
  networking.networkmanager.enable = true;
  networking.interfaces.enp6s0.useDHCP = false;

  networking.interfaces.enp6s0.ipv4.addresses = [ {
		address = "192.168.1.10";
		prefixLength = 24;
              } ];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = ["192.168.1.11"];
  /* 
   */
   networking.firewall.enable = false;
   networking.firewall.interfaces.enp6s0.allowedTCPPorts = [ 80 5201 443 ];
  #networking.interfaces.enp2s0f0u4u4.useDHCP = true;
  #networking.nameservers = [ "1.1.1.1" ];
}
