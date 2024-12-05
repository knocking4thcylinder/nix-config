{ pkgs, ... }:

{
  programs = {
    nushell = {
      enable = false;

      shellAliases = {
        ll = "ls -l";
        rebuild = "nh os switch ~/nix-config";
        update = "nix flake update --flake ~/nix-config";
        ssh = "TERM=xterm-256color ssh";
        nix-shell = "nix-shell --run nu";
        vim = "nvim -u ~/nix-config/home-manager/neovim/nvim/init.lua";
        nvim = "nvim -u ~/nix-config/home-manager/neovim/nvim/init.lua";
      };

      extraConfig = ''
        $env.EDITOR = "nvim"
        $env.config = {
          show_banner: false
          edit_mode: vi
          completions: {
            case_sensitive: false
            quick: true
            partial: true
            algorithm: "fuzzy"
          }
        }
      '';
    };
  };
}
