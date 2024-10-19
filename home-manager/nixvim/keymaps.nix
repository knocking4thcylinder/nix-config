{ pkgs,  config, ... }:

{ 
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = [ "i" "n" ];
        key = "<ESC>";
        action = "<CMD>noh<CR><ESC>";
        options.desc = "Normal mode and clear highlight";
      }

      # tmux-navigator binds
      {
        mode = "n";
        key = "<c-k>";
        action = "<CMD>TmuxNavigateUp<CR>";
        options.desc = "vim-tmux-navigator stuff";
      }
      {
        mode = "n";
        key = "<c-h>";
        action = "<CMD>TmuxNavigateLeft<CR>";
        options.desc = "vim-tmux-navigator stuff";
      }
      {
        mode = "n";
        key = "<c-j>";
        action = "<CMD>TmuxNavigateDown<CR>";
        options.desc = "vim-tmux-navigator stuff";
      }
      {
        mode = "n";
        key = "<c-l>";
        action = "<CMD>TmuxNavigateRight<CR>";
        options.desc = "vim-tmux-navigator stuff";
      }
    ];
  };
}
