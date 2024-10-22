{ pkgs, config, ... }:

{

  home.packages = with pkgs; [ 
    github-cli
    any-nix-shell
    fzf
  ];

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shortcut = "a";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    historyLimit = 100000;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    
    extraConfig = ''
      unbind %
      bind - split-window -v
      unbind '"'
      bind | split-window -h                                                              

      bind -r j resize-pane -D 5
      bind -r h resize-pane -L 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      
      bind -r m resize-pane -Z
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      better-mouse-mode
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'main'
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];
  };

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
      update = "nix flake update ~/nix-config";
      # nix-shell = "nix-shell --run zsh";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
