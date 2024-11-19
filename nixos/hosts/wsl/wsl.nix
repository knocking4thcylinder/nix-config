{
  # secrets,
  hostname,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ../../../stylix
    inputs.home-manager.nixosModules.home-manager
  ];
  # FIXME: change to your tz! look it up with "timedatectl list-timezones"
  time.timeZone = "Europe/Moscow";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "lev-wsl";

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      lev-nix = import ../../../home-manager/home.nix;
    };
  };

  systemd.tmpfiles.rules = [
    "d /home/lev-nix/.config 0755 lev-nix users"
    "d /home/lev-nix/.config/lvim 0755 lev-nix users"
  ];

  # FIXME: change your shell here if you don't want zsh
  environment.pathsToLink = ["/share/nu"];
  environment.shells = [pkgs.nushell];

  environment.enableAllTerminfo = true;

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  users.users.lev-nix = {
    isNormalUser = true;
    # FIXME: change your shell here if you don't want zsh
    shell = pkgs.nushell;
    extraGroups = [
      "wheel"
      "docker"
    ];
    # FIXME: add your own hashed password
    # hashedPassword = "";
    # FIXME: add your own ssh public key
    # openssh.authorizedKeys.keys = [
    #   "ssh-rsa ..."
    # ];
  };

  environment.systemPackages = [
    (import ./win32yank.nix {inherit pkgs;})
    pkgs.nushell
    pkgs.busybox
    pkgs.nh
    pkgs.ookla-speedtest
    pkgs.wget
    pkgs.btop
    pkgs.zig
    pkgs.wl-clipboard
    pkgs.gcc
  ];

  system.stateVersion = "22.05";

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = "lev-nix";
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  # FIXME: uncomment the next block to make vscode running in Windows "just work" with NixOS on WSL
  # solution adapted from: https://github.com/K900/vscode-remote-workaround
  # more information: https://github.com/nix-community/NixOS-WSL/issues/238 and https://github.com/nix-community/NixOS-WSL/issues/294
  # systemd.user = {
  #   paths.vscode-remote-workaround = {
  #     wantedBy = ["default.target"];
  #     pathConfig.PathChanged = "%h/.vscode-server/bin";
  #   };
  #   services.vscode-remote-workaround.script = ''
  #     for i in ~/.vscode-server/bin/*; do
  #       echo "Fixing vscode-server in $i..."
  #       ln -sf ${pkgs.nodejs_18}/bin/node $i/node
  #     done
  #   '';
  # };

  nix = {
    settings = {
      trusted-users = [ "lev-nix" ];
      # FIXME: use your access tokens from secrets.json here to be able to clone private repos on GitHub and GitLab
      # access-tokens = [
      #   "github.com=${secrets.github_token}"
      #   "gitlab.com=OAuth2:${secrets.gitlab_token}"
      # ];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

    registry = {
      nixpkgs = {
        flake = inputs.nixpkgs;
      };
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    package = pkgs.nixVersions.stable;
    extraOptions = ''experimental-features = nix-command flakes'';

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
}