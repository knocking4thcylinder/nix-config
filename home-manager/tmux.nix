{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shortcut = "a";
    shell = "${pkgs.nushell}/bin/nu";
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
}