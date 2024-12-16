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

    packages = with pkgs; [
      # neovim plugin dependencies
      gnumake
      luarocks
      luajit

      # LSPs
      haskell-language-server
      lua-language-server
      nixd
      jdt-language-server
      rust-analyzer
      zls
      python312Packages.python-lsp-server

      # formatters
      python312Packages.black
      python312Packages.isort
      clang-tools
      google-java-format
      nixfmt-rfc-style
      lemminx
      stylua
    ];
  };
}
