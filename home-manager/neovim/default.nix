{ pkgs, config, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  home = {
    file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ./nvim;
      recursive = true;
    };

    packages = [
      pkgs.stylua
      pkgs.luajit
      pkgs.lua-language-server
      pkgs.nixd
      pkgs.lemminx
      pkgs.java-language-server
      pkgs.rust-analyzer
      pkgs.zls
      pkgs.clang-tools
      pkgs.python312Packages.python-lsp-server
      pkgs.python312Packages.python-lsp-black
      pkgs.nixfmt-rfc-style
    ];
  };
}
