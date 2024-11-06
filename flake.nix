{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    stylix.url = "github:danth/stylix";
    base16.url = "github:SenchoPens/base16.nix";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    yandex-music.url = "github:cucumber-sp/yandex-music-linux";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      lev-wsl = nixpkgs.lib.nixosSystem {
      	specialArgs = {inherit inputs outputs;};
	modules = [
	  inputs.nixos-wsl.nixosModules.wsl
	  inputs.stylix.nixosModules.stylix
	  inputs.base16.nixosModule 
	  ./nixos/hosts/wsl/wsl.nix
	  ./nixos/hosts/wsl/hardware-config.nix
	];
      };
      
      lev-pc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
	  inputs.stylix.nixosModules.stylix
	  inputs.base16.nixosModule 
	  ./nixos/hosts/pc/hostname.nix
          ./nixos/hosts/pc/hardware-config.nix
	  ./nixos/hosts/laptop/configuration.nix
        ];
      };

      lev-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
	  inputs.stylix.nixosModules.stylix
	  inputs.base16.nixosModule
          ./nixos/hosts/laptop/hostname.nix
          ./nixos/hosts/laptop/hardware-config.nix
	  ./nixos/hosts/laptop/configuration.nix
        ];
      };
    };
  };
}
