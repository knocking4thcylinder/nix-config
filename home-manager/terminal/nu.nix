{ pkgs, ... }:

{
  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        ll = "ls -l";
        l = "ls -la";
        rebuild = "nh os switch ~/nix-config";
        update = "nix flake update --flake ~/nix-config";
        ssh = "TERM=xterm-256color ssh";
        nix-shell = "nix-shell --run nu";
        lg = "lazygit";
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
