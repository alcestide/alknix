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
	picard = {
		image = "mikenye/picard:latest";
		ports = ["5800:5800"];
		environment = {
			PUID = "1001";
			PGID = "1001";
			TZ = "Europe/Rome";
		};

		volumes = [
			"/home/alcestide/.config/picard:/config:rw"
			"/mnt/disk1/Music:/storage:rw"
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
};
};
}
