{ pkgs, config, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        any-nix-shell zsh --info-right | source /dev/stdin
        bindkey -v '^?' backward-delete-char
        export FZF_DEFAULT_OPTS="
          --color=fg:#908caa,bg:#101010,hl:#ebbcba
          --color=fg+:#e0def4,bg+:#101010,hl+:#ebbcba
          --color=border:#403d52,header:#31748f,gutter:#191724
          --color=spinner:#f6c177,info:#9ccfd8
          --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
      '';

      shellAliases = {
        lg = "lazygit";
        ls = "eza";
        ll = "eza -l";
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
  };
}
