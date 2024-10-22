{ pkgs, config, ... }:

{
  programs.nixvim = {
    extraConfigLua = ''
      vim.cmd [[
        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
      ]]
    '';
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
