{
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.interfaces.enp1s0.ipv4.addresses = [ {
		address = "192.168.1.11";
		prefixLength = 24;
	} ];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 4533 8384 ];
}
