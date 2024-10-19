{ pkgs, config, ... } :

{
  imports = [
    ./plugins.nix
    ./settings.nix
    ./keymaps.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };
}
