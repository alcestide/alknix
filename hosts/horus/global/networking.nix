{lib,host,...}:

{
  networking.hostName = host;
  networking.networkmanager.enable = true;
  networking.interfaces.enp6s0.ipv4.addresses = [ {
		address = "192.168.1.10";
		prefixLength = 24;
	} ];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
}
