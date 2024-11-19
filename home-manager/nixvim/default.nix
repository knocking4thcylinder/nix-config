{ pkgs, config, ... } :

{
  imports = [
    ./plugins.nix
    ./settings.nix
    ./keymaps.nix
  ];
  programs.nixvim = {
    enable = false;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };
}
