{
  pkgs,
  ...
}:

{
  imports = [
    ./shell_utils.nix
    ./nu.nix
    ./tmux.nix
    ./zsh.nix
    ./terminal.nix
  ];
}
