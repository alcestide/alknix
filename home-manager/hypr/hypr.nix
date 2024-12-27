{lib,...}:
{

services.hypridle = {
      enable = false;
      settings = {
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprlock";
          }
        ];
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
      ${builtins.readFile ./hyprland/hyprland.conf}
      '';
      xwayland.enable=true;
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = ["/etc/nixos/home-manager/hypr/assets/nix-catppuccin.png"];
        wallpaper = ["DP-1,/etc/nixos/home-manager/hypr/assets/nix-catppuccin.png"
                     "HDMI-A-1,/etc/nixos/home-manager/hypr/assets/nix-catppuccin.png"];
        splash = false;
    };
    };

    programs.hyprlock = {
      enable = true;
      extraConfig = ''
      ${builtins.readFile ./hyprlock/hyprlock.conf}
      '';
    };

    xdg.configFile."waybar/config".source = ./waybar/config;
    xdg.configFile."waybar/style.css".source = lib.mkDefault ./waybar/style.css;


  }
