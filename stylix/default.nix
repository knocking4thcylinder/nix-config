{ pkgs, config, lib, options, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    override = {
      base00 = "101010";
      base01 = "101010";
    };
    opacity = {
      terminal = 0.9;
      applications = 1;
    };
    image = ./nix-wallpaper-simple-dark-gray.png;
    targets = {
      nixvim.enable = false;
    };
    fonts = rec {
      sizes = {
        applications = 11;
        terminal = 11;
        desktop = 11;
        popups = 11;
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
        name = "JetBrainsMono Nerd Font";
      };
      monospace = sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
