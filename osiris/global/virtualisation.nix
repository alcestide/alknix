{pkgs,config,...}:

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

	cloudflare-ddns = {
		image = "oznu/cloudflare-ddns:latest";
		autoStart = true;
                volumes = ["/run/agenix/cloudflare:/API_KEY_FILE"];
		environment = {
			API_KEY_FILE="/API_KEY_FILE";
			ZONE="alcestide.com";
			SUBDOMAIN="*";
			PROXIED="false";
			CRON="* * * * *";
		};
      };

};
};
}
