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

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };
  };
}
