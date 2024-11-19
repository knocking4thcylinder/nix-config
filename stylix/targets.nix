{ pkgs, config, lib, ... }:

{
  stylix.targets = {
    nixvim.enable = false;
    neovim.enable = false;
  };
}
