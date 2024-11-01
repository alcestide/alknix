{pkgs, ...}:
{
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.interfaces.enp1s0.ipv4.addresses = [ {
		address = "192.168.1.11";
		prefixLength = 24;
	} ];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 20 21 22 81 574 3131 
					  4533 5806 8083 8080 8384 
					];
  networking.firewall.allowedUDPPorts = [ 53 574 51820];
  networking.firewall.allowedTCPPortRanges = [ { from = 51000; to = 51999; } ];
  networking.hostName = "osiris";
  networking.nat.enable = true;
  networking.nat.externalInterface = "enp1s0";
  networking.nat.internalInterfaces = [ "wg0" "ppp0" ];
  networking.wireguard.enable = true;
  networking.wireguard.interfaces."wg0" = {
    postSetup = ''
    	${pkgs.iptables}/bin/iptables -A FORWARD -s 10.10.10.0/23 -i wg0 -j DROP
    	${pkgs.iptables}/bin/iptables -I FORWARD -s 10.10.10.0/23 -d 192.168.1.231/32 -i wg0 -j ACCEPT
     '';
     postShutdown = ''
    	${pkgs.iptables}/bin/iptables -D FORWARD -s 10.10.10.0/23 -i wg0 -j DROP
    	${pkgs.iptables}/bin/iptables -D FORWARD -s 10.10.10.0/23 -d 192.168.1.231/32 -i wg0 -j ACCEPT
      '';

     privateKeyFile = "/home/alcestide/.config/wireguard/privatekey";
     ips = [ "10.10.10.1/24"  ];
     listenPort = 51820;
     peers = [ 
       { 
        publicKey = "izsKipmN8tGckQsaj4DYrDADQ7U2P66mu3BUP+47/iY=";
        allowedIPs = [ "10.10.10.2/32"  ]; 
      } 
      {
        publicKey = "bJPRSK1wqf8TEOyXkgk3iTpvjg1RVG26aPAmWpA2GmE=";
        allowedIPs = [ "10.10.10.3/32"];
      }
     ];
   };
}
