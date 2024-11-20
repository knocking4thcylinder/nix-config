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

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

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
