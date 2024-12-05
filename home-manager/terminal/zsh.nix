{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    github-cli
    any-nix-shell
    fzf
    eza
  ];

  programs = {
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
        lg = "lazygit";
        ls = "eza";
        ll = "eza -l";
        rebuild = "nh os switch ~/nix-config";
        update = "nix flake update --flake ~/nix-config";
        ssh = "TERM=xterm-256color ssh";
        vim = "nvim -u ~/nix-config/home-manager/neovim/nvim/init.lua";
        nvim = "nvim -u ~/nix-config/home-manager/neovim/nvim/init.lua";
        # nix-shell = "nix-shell --run zsh";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };
  };
}
