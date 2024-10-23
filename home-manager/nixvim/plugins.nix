{ pkgs, config, ... }:

{
  programs.nixvim.plugins = {
    lualine.enable = true;
    web-devicons.enable = true;
    sleuth.enable = true;
    commentary.enable = true;
    # hardtime.enable = true;
    tmux-navigator.enable = true;

    todo-comments.settings = {
      enable = true;
      signs = true;
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

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "cmp-calc"; }
        { name = "buffer"; }
      ];
      settings = {
        mapping = {
          # "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          # "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # "<C-Space>" = "cmp.mapping.complete()";
          # "<C-e>" = "cmp.mapping.close()";
          # "<Tab>" = {
          #   modes = ["i" "s"];
          #   action = "cmp.mapping.select_next_item()";
          # };
          # "<S-Tab>" = {
          #   modes = ["i" "s"];
          #   action = "cmp.mapping.select_prev_item()";
          # };
          # "<CR>" = "cmp.mapping.confirm({ select = true })";

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
        window.completion.border = "rounded";
        window.documentation.border = "rounded";
      };
    };

    lsp-format = {
      enable = true;
    };
  };
}
