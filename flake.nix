{
  description = "ALK's NixOS conf.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:/alcestide/nixvim";
    };
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    agenix.url = "github:ryantm/agenix";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,nixpkgs,flake-utils,
    home-manager,catppuccin,
    nixvim,agenix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    host = "osiris";
    username = "alcestide";
    systems = ["x86_64-linux"];
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        inherit username;
        inherit host;
      });
  in {
    inherit lib;
    #overlays = import ./hosts/${host}/overlays {inherit inputs host;};
    nixosConfigurations = {
      osiris = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username host nixvim;};
        modules = [./global/configuration.nix 
                    agenix.nixosModules.default
                    catppuccin.nixosModules.catppuccin
                    home-manager.nixosModules.home-manager {
                home-manager = { 
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.${username} = 
                    { imports = 
                    [ 		
			./home-manager/home.nix	
                        catppuccin.homeManagerModules.catppuccin
			
			];};
                        };
                }];
            };
        };
        };
    }
