{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux-sessionizer
  ];
  
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shortcut = "a";
    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    terminal = "screen-256color";
    historyLimit = 100000;
    escapeTime = 0;
    clock24 = true;
    keyMode = "vi";
    mouse = true;

    extraConfig = ''
      unbind %
      unbind '"'
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind -r j resize-pane -D 5
      bind -r h resize-pane -L 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5

      bind -r m resize-pane -Z
      bind C-o display-popup -E "tms"
      bind C-j display-popup -E "tms switch"
      bind C-w command-prompt -p "Rename active session to: " "run-shell 'tms rename %1'"
      bind C-r "run-shell 'tms refresh'"
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      better-mouse-mode
      tmux-fzf
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'main'
        '';
      }
    ];
  };
}
