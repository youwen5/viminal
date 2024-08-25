# Neovim Configuration Flake

This is the Neovim configuration for all my NixOS and Nix enabled systems (such as with nix-darwin on macOS).
It aims to be minimal and utilitarian; it forgoes blingful features like status lines, sidebars, or fancy UI enhancements
in favor of native (neo)Vim, while still having everything useful you'd expect, like LSPs, file explorer (`yazi`), completions,
advanced language tools, and QoL enhancements.

It uses the [Nixvim](https://nix-community.github.io/nixvim/) project under the hood to declaratively
configure Neovim and its plugins, and installs some LSPs and other tools needed by it (like `yazi`, `fd`, etc).

It simply outputs a package, called `nvim`. It can be called just like the regular `nvim` package, except it bundles
all of my custom configuration and their dependencies with the power of Nix.

You can try it, remotely, in one line:
```sh
nix run 'github:youwen5/neovim-flake'
```

Feel free to fork or copy the config to use yourself. It's free in the [public domain](./LICENSE).

Thanks to [this gist](https://gist.github.com/siph/288b7c6b5f68a1902d28aebc95fde4c5) for showing me how to
build a Nixvim configuration as a standalone Nix package.

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
