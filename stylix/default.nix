{
  pkgs,
  config,
  lib,
  options,
  ...
}:

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
    fonts = {
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 12;
        popups = 12;
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        # name = "JetBrains Mono NF";
        name = "Fira Code Nerd Font Mono";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        # name = "JetBrains Mono NF";
        name = "Fira Code Nerd Font Mono";
      };
      emoji = {
        package = pkgs.font-awesome_6;
        name = "Font Awesome 6";
      };
    };
  };
}
