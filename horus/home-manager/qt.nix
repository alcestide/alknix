{pkgs,...}:

{
  qt = {
        enable = true;
        platformTheme.name = "kvantum";
        style = {
          name = "kvantum";
          package = pkgs.catppuccin-qt5ct;
        };
      };
    }
