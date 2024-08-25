# Neovim Configuration Flake

This is the Neovim configuration I use as a [home-manager](https://nix-community.github.io/home-manager/) module
for all my NixOS and home-manager enabled systems (such as with nix-darwin on macOS).

It uses the [Nixvim](https://nix-community.github.io/nixvim/) project under the hood to declaratively
configure Neovim and its plugins, and installs some LSPs and other tools needed by it (like `yazi`, `fd`, etc).

It can be consumed directly in your configuration but as it contains many heavily opinionated and
personalized configuration options, you should probably just use it as inspiration or as an example
for your own config.

Feel free to fork or copy the config to use yourself. It's free in the [public domain.](./LICENSE).

## Usage

Add it to your flake inputs, and import `homeManagerModules.default` as a home-manager module:

```nix
# flake.nix
{
  description = "Your system configuration flake.";

  inputs = {
    # -- snip --
    neovim-config = {
      url = "github:youwen5/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # -- snip --
  };
  # -- snip --
}
```

```nix
# Wherever you're setting up your home-manager modules:

home-manager.users.<your-username> = {
  imports = [
    # -- snip --
    inputs.neovim-config.homeManagerModules.default
    # -- snip --
  ];
};
```
