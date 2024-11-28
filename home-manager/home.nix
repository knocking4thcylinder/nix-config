# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./neovim
    ./nixvim
    ./shell.nix
    ./terminal.nix
    ../stylix/targets.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # TODO: Set your username
  home = {
    username = "lev-nix";
    homeDirectory = "/home/lev-nix";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    yazi
    lazygit
    ripgrep
    telegram-desktop
    vesktop
    zoom-us
    lutris
  ];

  targets.genericLinux.enable = true;
  programs.fastfetch.enable = true;
  programs.bat.enable = true;
  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "knocking4thcylinder";
    userEmail = "lev.fedorets@ya.ru";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
