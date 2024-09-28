{
  services.dunst = {
    enable = true;
    /*
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 300;
        height = 300;
        origin = "bottom-center";
        offset = "100x50";
        notification_limit = 20;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;    
        progress_bar_corner_radius = 0;
        highlight = "#ffffff";
        icon_corner_radius = 0;
        max_icon_size = 128;
        indicate_hidden = "yes";
        transparency = 3;
        separator_height = 2;
        padding = 15;
        horizontal_padding = 12;
        # [...]
      # Honestly, I couldn' be bothered so...
      };
      };
      */
    configFile = "/etc/nixos/home-manager/dunst/dunstrc";
  };
}
