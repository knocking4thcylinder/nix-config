{ pkgs, config, ... }:

{
  stylix = {
    targets = {
      nixvim.enable = false;
      gnome.enable = false;
    };
    polarity = "dark";
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    # base16Scheme = (config.lib.base16.mkSchemeAttrs "${pkgs.base16-schemes}/share/themes/rose-pine.yaml").override {
    #   scheme = "Now it's my scheme >:]";
    #   base00 = "000000";  # make background completely black
    # };
    # override.base16Scheme.base00 = "000000";
    opacity = {
      terminal = 0.9;
      applications = 1;
    };
    image = ./nix-wallpaper-simple-dark-gray.png;
    fonts = rec {
      sizes = {
        terminal = 12;
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
