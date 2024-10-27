{pkgs,...}:

{
services = {
  xserver.xkb.layout = "us";
  printing.enable = true;
  openssh.enable = true;
  adguardhome.enable = true;

  navidrome = {
	enable = true;
	settings = { MusicFolder ="/mnt/disk1/Music";
		     Address = "0.0.0.0";
		     ScanSchedule = "@every 5m";
		   };
	openFirewall = true;

};
  syncthing = {
	enable = true;
	dataDir = "/home/alcestide/Documents";
	configDir = "/home/alcestide/Documents/.config/syncthing";
	guiAddress = "0.0.0.0:8384";
	user = "alcestide";
	group = "wheel";
	openDefaultPorts = true;
};
  vaultwarden = {
	enable = true;
	config = {
		ROCKET_ADDRESS = "0.0.0.0";
		ROCKET_PORT = 8222;
		};
	};
  
  vsftpd = {
    enable = true;
    writeEnable = true;
    localUsers = true;
    userlist = [ "alcestide" ];
    userlistEnable = true;
    extraConfig = ''
	  pasv_enable=Yes
  	pasv_min_port=51000
  	pasv_max_port=51999
	'';

  };

 fail2ban = {
    enable = true;
   # Ban IP after 5 failures
    maxretry = 5;
    ignoreIP = [
      # Whitelist some subnets
      "192.168.1.0/24"
      "10.10.10.0/24" # whitelist a specific IP
    ];
    bantime = "24h"; # Ban IPs for one day on the first ban
    bantime-increment = {
      enable = true; # Enable increment of bantime after each violation
      formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
      #multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h"; # Do not ban for more than 1 week
      overalljails = true; # Calculate the bantime based on all the violations
    };
    jails = {
      apache-nohome-iptables.settings = {
        # Block an IP address if it accesses a non-existent
        # home directory more than 5 times in 10 minutes,
        # since that indicates that it's scanning.
        filter = "apache-nohome";
        action = ''iptables-multiport[name=HTTP, port="http,https"]'';
        logpath = "/var/log/httpd/error_log*";
        backend = "auto";
        findtime = 600;
        bantime  = 600;
        maxretry = 5;
      };
    };
  };

};

}
