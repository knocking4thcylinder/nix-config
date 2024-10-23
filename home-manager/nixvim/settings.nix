{ pkgs, config, ... }:

{
  programs.nixvim = {
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
