{
  description = "Personal Neovim configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixvim,
    ...
  }: {
    homeManagerModules.default = {
      imports = [nixvim.homeManagerModules.nixvim ./default.nix];
    };
  };
}
