{ pkgs, config, ... }:

{
  programs.nixvim = {
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        # dim_inactive_windows = true;
        extend_background_behind_borders = true;
        styles.transparency = true;
        highlight_groups."default".bg = "101010";
      };
    };
    
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    opts = {
      # background = "";
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard.providers.wl-copy.enable = true;
      undofile = true;
      scrolloff = 10;
    };
  };
}
