{host,...}:

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
  networking.nameservers = ["192.168.1.1"];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 80 1723 8384 8096 ];
  networking.firewall.allowedUDPPorts = [ 1723 5353 51820 ];
# networking.bridges."br0".interfaces = [ "enp6s0" ];
# networking.interfaces."br0".ipv4.addresses = [{
#   address = "192.168.1.10";
#   prefixLength = 24;
# }];

}
