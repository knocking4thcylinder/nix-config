{
  pkgs,
  lib,
  ...
}:

{
  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "
      --color=fg:#908caa,bg:#101010,hl:#ebbcba
      --color=fg+:#e0def4,bg+:#101010,hl+:#ebbcba
      --color=border:#403d52,header:#31748f,gutter:#191724
      --color=spinner:#f6c177,info:#9ccfd8
      --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa";
  };
  home.packages = with pkgs; [
    github-cli
    any-nix-shell
    copyq
  ];

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = false;
      icons = "auto";
      colors = "always";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    starship = {
      enable = true;
      settings = {
        kotlin.symbol = " ";
        gradle.symbol = " ";
        add_newline = false;
      };
    };

    carapace = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
