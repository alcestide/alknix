{
services = {
  xserver.xkb.layout = "us";
  printing.enable = true;
  openssh.enable = true;
  adguardhome.enable = true;

 /*
  dnsmasq = {
	enable = true;
	alwaysKeepRunning = true;
	settings = {
		address="/.local/127.0.0.1";
		    log-dhcp = true;
		    log-queries = true;
    		    #log-facility="/home/alcestide/.dnsmasq.log";
		};
		
	};
*/
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
  };
};

}
