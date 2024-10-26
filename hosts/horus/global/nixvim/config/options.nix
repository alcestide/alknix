{self, ...}: {

  globals.mapleader = " ";
  globalOpts = {
    undofile = true;
    number = true;
    relativenumber = true;
    nu= true;
    statuscolumn= "%s %l %r ";
    signcolumn = "yes";
    ignorecase = true;
    smartcase = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    cursorline = true;
    clipboard="unnamedplus";
    ruler = true;
    gdefault = true;
    scrolloff = 5;
    autochdir=true;
  };

  localOpts = {
    undofile = true;
    number = true;
    relativenumber = true;
    nu= true;
    statuscolumn= "%s %l %r ";
    signcolumn = "yes";
    ignorecase = true;
    smartcase = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    cursorline = true;
    clipboard="unnamedplus";
    ruler = true;
    gdefault = true;
    scrolloff = 5;
    autochdir=true;
  };



  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
