# viminal

This is the Neovim configuration for all my NixOS and Nix enabled systems
(including macOS). It aims to be minimal and utilitarian; it forgoes many
blingful features like sidebars or fancy UI enhancements in favor of native
(neo)Vim, while still having everything useful you'd expect, like LSPs, file
explorer (`oil.nvim`), completions, advanced language tools, and QoL
enhancements. Additionally, a small wrapper script called `vimg` is provided in
`packages.${system}.vimg` which simply opens Neovim inside the `Neogit` UI.
This allows it to be used as a quick git TUI from the shell.

The central design goal is to prefer Vim whenever possible. The Vim text editor
is already incredibly powerful, and many plugins designed to emulate features
from more bloated editors like VS Code can already be accomplished in native
Vim. To that end, plugins were selected to unobtrusively integrate with Vim.
For instance, `oil.nvim` allows you to interface with your filesystem through a
regular Vim buffer, and Git integration is done by Gitsigns and `Neogit`, which
enable a similar interface for Git. The long-term benefit of this is avoiding
lock-in to a plugin that encourages a heavily idiosyncratic workflow which may
become unmaintained in the future, while the Neovim core itself is almost
assuredly going stick around.

It uses the [Nixvim](https://nix-community.github.io/nixvim/) project under
the hood to declaratively configure Neovim and its plugins, and installs tools
needed by it (like `ripgrep`, `fd`, etc). However, LSPs are not installed or
handled by the plugin. The user is expected to provide their own LSPs in the
`$PATH`, but since they are using Nix, this is trivial.

The flake simply provides a package that contains the binaries `nvim`, `vim`,
and `vi`. It can be called just like the regular `nvim` binary (`vim` and `vi`
are just symlinks to `nvim`), except it bundles all of my custom configuration
and their dependencies with the power of Nix. Plugins are managed by Nix. An
entirely self-contained, reproducible, purely functional text editor. Amazing.

All plugins are precompiled to Lua bytecode by `Luajit` when the package is
built for maximum speed and efficiency. When possible, plugins are also
combined for a massive efficiency boost. This allows startup times as fast as
lazy loading without all of the hassle.

Feel free to fork or copy the config to use yourself. It's free in the [public
domain](./LICENSE).

Thanks to [this
gist](https://gist.github.com/siph/288b7c6b5f68a1902d28aebc95fde4c5) for
showing me how to build a Nixvim configuration as a standalone Nix package.

## Usage

You can test drive my config in just one line (if you have Nix, of course):

```sh
nix run 'github:youwen5/viminal' --extra-experimental-features flakes --extra-experimental-features nix-command
```

If for some reason, you want to install it permanently, add it to your flake
inputs, and install the package in the usual way:

```nix
# flake.nix
{
  description = "Your system configuration flake.";

  inputs = {
    # -- snip --
    viminal.url = "github:youwen5/viminal";
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
    inputs.viminal.packages.${system}.default
    # supported systems: x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin
  ];
}
```

> [!WARNING]
> This package will add the symlinks `vim -> nvim` and `vi -> nvim`
> so it will conflict with `pkgs.vim` and any programs installing binaries
> called `vim` or `vi`. You must remove existing Neovim and Vim packages to
> install this.
