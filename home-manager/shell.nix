{ pkgs, config, ... }:

{

  home.packages = with pkgs; [ 
    github-cli
    any-nix-shell
  ];
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
 
    initExtra = ''
      any-nix-shell zsh --info-right | source /dev/stdin
      bindkey -v '^?' backward-delete-char
      source "$(fzf-share)/key-bindings.zsh"
      source "$(fzf-share)/completion.zsh"
    '';

    shellAliases = {
      ll = "ls -l";
      rebuild = "nh os switch ~/nix-config";
      nix-shell = "nix-shell --run zsh";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };
}
