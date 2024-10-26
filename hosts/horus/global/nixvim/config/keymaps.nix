{self, ...}: {
  keymaps = [

    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
    }
    
    {
      action = "<cmd>FzfLua buffers<CR>";
      key = "<leader>fb";
    }

    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
    }

    {
      action = "<cmd>Telescope builtin<CR>";
      key = "<leader>fz";
    }
    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<F5>";
    }
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>t";
    } 
    {
      action = "<cmd>Oil<CR>";
      key = "<C-n>";
    }
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>e";
    }
    {
      action = "<cmd>Neogit<CR>";
      key = "<leader>g";
    }

    {

      action = "<cmd>:lua require('neoscroll').scroll(-vim.wo.scroll,true,300)<CR>";
      key = "<C-a>";
    }

    {
      action = "<cmd>:lua vim.lsp.buf.hover()<CR>";
      key = "K";
    }

    {
      action = "<cmd>:lua vim.lsp.buf.definition()<CR>";
      key = "fd";
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }
  ];
}

