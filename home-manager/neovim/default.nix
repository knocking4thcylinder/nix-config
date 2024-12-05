{ pkgs, config, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    haskell-language-server
    stylua
    luajit
    lua-language-server
    nixd
    lemminx
    java-language-server
    rust-analyzer
    zls
    clang-tools
    python312Packages.python-lsp-server
    python312Packages.black
    python312Packages.isort
    nixfmt-rfc-style
  ];
}
