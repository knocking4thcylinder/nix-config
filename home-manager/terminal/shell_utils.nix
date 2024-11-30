{
  pkgs,
  config,
  ...
}:

{
  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };

    carapace = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
