{
  pkgs,
  lib,
  stdenv,
}:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      donjayamanne.python-extension-pack
      ms-vscode.cpptools-extension-pack
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
