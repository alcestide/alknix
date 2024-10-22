{pkgs, ...}:
{
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.interfaces.enp1s0.ipv4.addresses = [ {
		address = "192.168.1.11";
		prefixLength = 24;
	} ];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 20 21 22 574 3131 4533 8384 51820 ];
  networking.firewall.allowedUDPPorts = [ 53 574];
  networking.firewall.allowedTCPPortRanges = [ { from = 51000; to = 51999; } ];
  networking.hostName = "osiris";
/*
 networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.1/24"  ];

      listenPort = 51820;
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT; ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE;
      '';

      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT; ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o enp1s0 -j MASQUERADE;
      '';


      privateKeyFile = "/home/alcestide/wireguard-keys/host_privatekey";
      peers = [
        {
          publicKey = "ZQKUJ+gQ0mJQiQx5iNMmH5zOgNzlytqLqk+smsyvKnc=";
          allowedIPs = ["10.100.0.0/24" "0.0.0.0/0" ];
        }

      ];
    };
  };
*/
}
