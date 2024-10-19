{ pkgs, config, ... }:

{
  programs.nixvim.plugins = {
    lualine.enable = true;
    web-devicons.enable = true;
    sleuth.enable = true;
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
        nil_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        zls.enable = true;
        pylsp.enable = true;
        lua_ls.enable = true;
      };
    };

    lsp-format = {
      enable = true;
    };
  };
}
