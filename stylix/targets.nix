{ pkgs, config, lib, ... }:

{
  stylix.targets = {
    fzf.enable = false;
    nixvim.enable = false;
    neovim.enable = false;
    vscode.enable = false;
  };
}
