{ pkgs, config, ... }:

{
  imports = [
    ./tmux.nix
    ./nu.nix
  ];
  home.packages = with pkgs; [ 
    github-cli
    any-nix-shell
    fzf
  ];
  
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    zsh = {
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
        update = "nix flake update --flake ~/nix-config";
        ssh = "TERM=xterm-256color ssh";
        # nix-shell = "nix-shell --run zsh";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };
  
    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };
  };
}
