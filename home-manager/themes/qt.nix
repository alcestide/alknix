{pkgs,...}:

{
  qt = {
        enable = true;
        platformTheme.name = "qtct";
        style = {
          name = "kvantum";
          package = pkgs.dracula-theme;
        };
      };

      xdg.configFile = {
  "Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Dracula
  '';

  "Kvantum/Dracula".source = "${pkgs.dracula-theme}/share/Kvantum/Dracula";
};

    }


