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
   /*

  networking.nat.enable = true;
  networking.nat.externalInterface = "enp6s0";
  networking.nat.internalInterfaces = [ "wg0" "ppp0" ];
  networking.wireguard.enable = true;
  networking.wireguard.interfaces."wg0" = {
    postSetup = ''
    ${pkgs.iptables}/bin/iptables -I INPUT -p udp --dport 51820 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -I FORWARD -i eth0 -o wg0 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -I FORWARD -i wg0 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
     '';
     postShutdown = ''
    ${pkgs.iptables}/bin/iptables -D INPUT -p udp --dport 51820 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -D FORWARD -i eth0 -o wg0 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
    ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
      '';

     privateKeyFile = "/home/alcestide/wireguard/clients/horus/privatekey";
     ips = [ "10.10.10.1/24"  ];
     listenPort = 51820;
     peers = [ 
       { 
        # Dummy
        publicKey = "izsKipmN8tGckQsaj4DYrDADQ7U2P66mu3BUP+47/iY=";
        allowedIPs = [ "10.10.10.2/32"  ]; 
      } 
      {
        # Phone
        publicKey = "bJPRSK1wqf8TEOyXkgk3iTpvjg1RVG26aPAmWpA2GmE=";
        allowedIPs = [ "10.10.10.3/32"];
      }
     ];
   };

  */
}
