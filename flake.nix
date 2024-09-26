{
  description = "ALK's NixOS conf.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:alcestide/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    #nixpkgs-unstable,
    flake-utils,
    home-manager,
    catppuccin,
    nixvim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
      });
  in {
    inherit lib;
    packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      alknix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./nixos/configuration.nix 
                    catppuccin.nixosModules.catppuccin
                   home-manager.nixosModules.home-manager {
                    home-manager = { 
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.alcestide = { imports = [ ./home-manager/home.nix
                                                    #nixvim.homeManagerModules.nixvim
                                                    catppuccin.homeManagerModules.catppuccin];};
                  };}];
                };};
                };
              }
