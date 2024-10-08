{
  plugins = {

    nix = {
      enable = true;
    };

    bufferline = {
      enable = true;
    };

    lualine = {
      enable = true;
    };

    neoscroll = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };

    nvim-autopairs = {
      enable = true;
    };

    spectre = {
      enable = true;
    };

    leap = {
      enable = true;
    };

    fzf-lua = {
      enable = true;
    };

    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 144;
      render = "default";
      timeout = 10;
      topDown = true;
    };

    persistence.enable = true;

    toggleterm = {
      enable = true;
      settings = {
        hide_numbers = false;
        autochdir = true;
        close_on_exit = true;
        direction = "vertical";
      };
    };

    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    noice = {
      enable = true;
    };


    which-key = {
      enable = true;
    };
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

    illuminate = {
      enable = true;
      underCursor = false;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "reason"
      ];
    };

    alpha = {
      enable = true;
      theme = "dashboard";
    };

  };



}

