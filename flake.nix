{
  description = "ALK's NixOS conf.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim/update/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    sops-nix.url = "github:Mic92/sops-nix";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,nixpkgs,flake-utils,
    home-manager,catppuccin,nixvim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    # -------------------
    # horus: main rig
    # osiris: home-server
    # ---------------------------------------
    # nixos-rebuild- --switch --flake .#{HOST}
    # ---------------------------------------

    # Change host
    host = "horus";

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
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username host nixvim;};
        modules = [./hosts/${host}/global/configuration.nix 
                    nixvim.nixosModules.nixvim
                    catppuccin.nixosModules.catppuccin
                    home-manager.nixosModules.home-manager {
                home-manager = { 
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.${username} = 
                    { imports = 
                    [ ./hosts/${host}/home-manager/home.nix
			
                        catppuccin.homeManagerModules.catppuccin
			
			];};
                        };
                }];
            };
        };
        };
    }
