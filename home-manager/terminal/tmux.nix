{ pkgs, ... }:

{
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
    ];
  };
}
