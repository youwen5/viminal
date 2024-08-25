{
  description = "Personal Neovim configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixvim,
    nixpkgs,
    ...
  }: {
    homeManagerModules.default = {
      imports = [nixvim.homeManagerModules.nixvim ./homeManagerModule];
    };
  };
}
