# Neovim Configuration Flake

This is the Neovim configuration for all my NixOS and Nix enabled systems (such
as with nix-darwin on macOS). It aims to be minimal and utilitarian; it forgoes
many blingful features like status lines, sidebars, or fancy UI enhancements in
favor of native (neo)Vim, while still having everything useful you'd expect,
like LSPs, file explorer (`yazi`), completions, advanced language tools, and
QoL enhancements.

It uses the [Nixvim](https://nix-community.github.io/nixvim/) project under the
hood to declaratively configure Neovim and its plugins, and installs some LSPs
and other tools needed by it (like `yazi`, `fd`, etc).

It simply outputs a package which provides the binary `nvim`. It can be called
just like the regular `nvim` binary, except it bundles all of my custom
configuration and their dependencies with the power of Nix. An entirely
self-contained, reproducible, purely functional text editor. Amazing.

Feel free to fork or copy the config to use yourself. It's free in the [public
domain](./LICENSE).

Thanks to [this
gist](https://gist.github.com/siph/288b7c6b5f68a1902d28aebc95fde4c5) for
showing me how to build a Nixvim configuration as a standalone Nix package.

## Usage

You can test drive my config in just one line (if you have Nix, of course):

```sh
nix run 'github:youwen5/neovim-flake' --extra-experimental-features flakes --extra-experimental-features nix-command
```

If for some reason, you want to install it permanently, add it to your flake
inputs, and install the package in the usual way:

```nix
# flake.nix
{
  description = "Your system configuration flake.";

  inputs = {
    # -- snip --
    custom-neovim.url = "github:youwen5/neovim-flake";
  };
    # -- snip --
  };
  # -- snip --
}
```

```nix
# Wherever you install packages for your system or user:

{inputs, system, ...}:
{
  environment.systemPackages = [
    inputs.custom-neovim.packages.${system}.default
    # supported systems: x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin
  ];
}
```

> [!WARNING]
> This package will add the symlinks `vim -> nvim` and `vi -> nvim`
> so it will conflict with `pkgs.vim` and any programs installing binaries
> called `vim` or `vi`. You must remove existing Neovim and Vim packages to
> install this.
