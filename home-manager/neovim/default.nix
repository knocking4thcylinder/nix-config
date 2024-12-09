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
      gnumake
      luarocks
      haskell-language-server
      stylua
      luajit
      lua-language-server
      nixd
      lemminx
      jdt-language-server
      rust-analyzer
      zls
      clang-tools
      python312Packages.python-lsp-server
      python312Packages.black
      python312Packages.isort
      nixfmt-rfc-style
    ];
  };
}
