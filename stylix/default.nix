{ pkgs, config, ... }:

{
  stylix = {
    targets = {
      # nixvim.enable = false;
      # gnome.enable = false;
    };
    polarity = "dark";
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/vesper.yaml";
    override.base00 = "101010";
    override.base01 = "101010";
    # opacity = {
    #   terminal = 1;
    #   applications = 1;
    # };
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
