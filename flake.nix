{
  description = "Maske Thinkpad Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, disko, ... }@inputs: {
    nixosConfigurations = {
      zmask = nixpkgs.lib.nixosSystem { # HOSTNAME
      specialArgs = {inherit inputs;};
      modules = [
        inputs.disko.nixosModules.disko
        ./disk.nix
        ./configuration.nix
        # inputs.home-manager.nixosModules.default
      ];
    };
  };
  };
}
