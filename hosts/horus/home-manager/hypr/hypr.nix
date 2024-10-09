{lib,...}:
{
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
      '';
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = ["/etc/nixos/hosts/horus/home-manager/hypr/assets/dark-cat-rosewater.png"];
        wallpaper = ["DP-1,/etc/nixos/hosts/horus/home-manager/hypr/assets/dark-cat-rosewater.png"];
        splash = false;
    };
    };

    programs.hyprlock = {
      enable = true;
      extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
      '';
    };


    xdg.configFile."waybar/config".source = ./waybar/config;
    xdg.configFile."waybar/style.css".source = ./waybar/style.css;
    programs.waybar = {
      enable = true;
    };

  }
