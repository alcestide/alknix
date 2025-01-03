  {pkgs, ...}:
  {
  gtk = {
    enable = true;
    /*

  iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
    theme = {
      name = "Tokyonight-Dark-B";
      package = pkgs.tokyonight-gtk-theme;
      };
      shell = {
       name = "Tokyonight-Dark-B";
      package = pkgs.tokyonight-gtk-theme;
      };
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
    */

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  #home.sessionVariables.GTK_THEME = "Tokyonight-Dark-B";
  }
