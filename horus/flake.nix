{
  description = "ALK's NixOS conf.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:alcestide/nixvim";
    #nixvim.url = "/home/alcestide/Git/nixvim/";
    nix-alien.url = "github:thiagokokada/nix-alien";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,nixpkgs,flake-utils,
    home-manager,catppuccin,nixvim,
    nix-alien,
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
        specialArgs = {inherit self inputs outputs system username host nixvim;};
        modules = [./global/configuration.nix 
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
