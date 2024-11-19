{ pkgs, inputs, config, ... }:

{
  programs = {
    kitty = {
      enable = true;
      settings = {
        shell = "/home/lev-nix/.nix-profile/bin/zsh";
        confirm_os_window_close = 1;
        dynamic_background_opacity = true;
        enable_audio_bell = false;
        mouse_hide_wait = "-1.0";
        window_padding_width = 0;
        hide_window_decorations = true;
        # background_opacity = "0.9";
        # background_blur = 4;
      };
    };

    alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
        };

        terminal = {
          shell = "/home/lev-nix/.nix-profile/bin/zsh";
        };
      };
    };
  };
}
