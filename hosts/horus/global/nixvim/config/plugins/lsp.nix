{
  plugins.lsp = {
      enable = true;
      servers = {
        #ts-ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil-ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        csharp-ls.enable = true; # C#
        yamlls.enable = true; # YAML

        lua-ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };
  }
