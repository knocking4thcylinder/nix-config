{
  pkgs,
  lib,
  stdenv,
  ...
}:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      mvllow.rose-pine
      bbenoist.nix
      ms-python.python
      ms-python.pylint
      ms-vscode.cpptools-extension-pack
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
    userSettings = {
      "editor.lineNumbers" = "relative";
      "workbench.colorTheme" = "Rosé Pine";
      "workbench.sideBar.location" = "right";
      "workbench.colorCustomizations" = {
        "editor.background" = "#101010";
        "editorIndentGuide.background1" = "#404040";

      };
    };
  };
}
