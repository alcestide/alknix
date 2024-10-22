{
virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      nginxproxymanager = {
        image = "jc21/nginx-proxy-manager:latest";
        ports = ["80:80" "81:81" "443:443"];
        volumes = [
          "/home/alcestide/nginxproxy/data:/data"
          "/home/alcestide/nginxproxy/letsencrypt:/etc/letsencrypt"
        ];
      };
      smokeping = {
	image = "lscr.io/linuxserver/smokeping:latest";
	environment = {
		PUID = "1001";
		PGID = "1001";
		TZ = "Europe/Rome";
		};
	ports = ["5806:80"];        
	volumes = [
          "/home/alcestide/.config/smokeping/config:/config"
          "/home/alcestide/.config/smokeping/data:/data"
        ];
	};
	calibre-web = {
		image = "lscr.io/linuxserver/calibre-web:latest";
		environment = {
			PUID = "1001";
			PGID = "1001";
			TZ = "Europe/Rome";
			};
		ports = ["8083:8083"];
		volumes = [
			"/home/alcestide/.config/calibreweb/config:/config"
			"/mnt/disk1/Books:/books"
		];
		};

/**
	ddns-updater = {
	    image = "qmcgaw/ddns-updater";
		ports = ["8000:8000"];
		volumes = ["/home/alcestide/Documents/ddns-updater:/updater/data"];
    environment = {
      PERIOD="1m";
      UPDATE_COOLDOWN_PERIOD="1m";
	PUBLICIP_FETCHERS="all";
      PUBLICIP_HTTP_PROVIDERS="all";
      PUBLICIPV4_HTTP_PROVIDERS="all";
      PUBLICIPV6_HTTP_PROVIDERS="all";
      PUBLICIP_DNS_PROVIDERS="all";
      PUBLICIP_DNS_TIMEOUT="3s";
      HTTP_TIMEOUT="10s";
      LISTENING_ADDRESS=":8000";
      ROOT_URL="/";
      LOG_LEVEL="info";
      LOG_CALLER="hidden";
      SHOUTRRR_ADDRESSES="";
	};
	autoStart = true;
};
**/

	cloudflare-ddns = {
		image = "oznu/cloudflare-ddns:latest";
		autoStart = true;
		environment = {
			API_KEY="placeholder";
			ZONE="alcestide.com";
			SUBDOMAIN="*";
			PROXIED="false";
		};
	};
};
};
}
