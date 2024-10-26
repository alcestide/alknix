{
  plugins = {

    nix = {
      enable = true;
    };

    lualine = {
      enable = true;
    };

    cmp_luasnip = {
      enable = true;
    };

    luasnip = {
      enable = true;
    };

    neoscroll = {
      enable = true;
    };

    oil = {
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

    telescope = {
      enable = true;
    };

    persistence.enable = true;

    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
      settings.attach_to_untracked = false;
    };

    neogit = {
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

