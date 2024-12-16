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
    fonts = {
      sizes = {
        applications = 14;
        terminal = 14;
        desktop = 14;
        popups = 14;
      };
      serif = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka NF";
        # name = "Fira Code Nerd Font Mono";
      };
      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "Iosevka Term NF";
        # name = "Fira Code Nerd Font Mono";
      };
      emoji = {
        package = pkgs.font-awesome_6;
        name = "Font Awesome 6";
      };
    };
  };
}
