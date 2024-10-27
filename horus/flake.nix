{
  description = "ALK's NixOS conf.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:alcestide/nixvim";
    };
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    sops-nix.url = "github:Mic92/sops-nix";
    agenix.url = "github:ryantm/agenix";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,nixpkgs,flake-utils,
    home-manager,catppuccin,agenix,nixvim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    host = "horus";
    username = "alcestide";
    system = ["x86_64-linux"];
    pkgsFor = lib.genAttrs system (system:
      import nixpkgs {
        inherit system;
        inherit username;
        inherit host;
      });
  in {
    inherit lib;
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system username host nixvim;};
        modules = [./global/configuration.nix 
                    #nixvim.nixosModules.nixvim
                    agenix.nixosModules.default
                    catppuccin.nixosModules.catppuccin
                    home-manager.nixosModules.home-manager {
                home-manager = { 
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.${username} = 
                    { imports = 
                    [ ./home-manager/home.nix
                        catppuccin.homeManagerModules.catppuccin
			
			];};
                        };
                }];
            };
        };
        };
    }
