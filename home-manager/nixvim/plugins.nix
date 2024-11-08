{ pkgs, config, ... }:

{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.stay-centered-nvim
      pkgs.luajit
    ];
  
  extraConfigLua = ''
    require('stay-centered').setup({})
  '';
  };

  programs.nixvim.plugins = {
    lualine.enable = true;
    web-devicons.enable = true;
    codeium-nvim.enable = true;
    sleuth.enable = true;
    commentary.enable = true;
    tmux-navigator.enable = true;

    todo-comments.settings = {
      enable = true;
      signs = true;
    };

    hardtime = {
      enable = true;
    };

    treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
        };
        indent.enable = true;
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        clangd.enable = true;
        zls.enable = true;
        pylsp.enable = true;
        lua_ls.enable = true;
        arduino_language_server.enable = true;
      };

      keymaps = {
        lspBuf = {
          gd = "definition";
          gD = "references";
          gt = "type_definition";
          gi = "implementation";
          K = "hover";
          "<F2>" = "rename";
        };
      };
    };

    telescope = {
      enable = true; 
      highlightTheme = "rose-pine";
      keymaps = {
        "<leader>fs" = "live_grep";
        "<leader>ff" = "find_files";
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "cmp-calc"; }
          { name = "buffer"; }
        ];
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<Tab>'] = cmp.mapping.select_next_item(),
              ['<S-Tab>'] = cmp.mapping.select_prev_item(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          '';
        };
        completion.autocomplete = [
          "require('cmp.types').cmp.TriggerEvent.TextChanged"
        ];
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
      };
    };
  };
}
