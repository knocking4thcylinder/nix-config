{
  pkgs,
  ...
}:

{
  imports = [
    ./nu.nix
    ./tmux.nix
    ./zsh.nix
    ./terminal.nix
  ];
}
