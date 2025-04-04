<!-- markdownlint-disable -->
<h1 align="center">
    <a name="top" title="nvim-nix">
        Nyanvim
    </a>
    <br />
    <img src="./assets/nyavim_logo_v2.png" alt="Nyanvim Logo" width="200" height="200">
</h1>
<div align="center">
  <a href="https://github.com/dileep-kishore/nyanvim">
  </a>
  <p>
    <strong>
      A <a href="https://neovim.io/">Neovim</a> configuration as a <a href="https://nixos.org/">Nix</a> flake ❄️ template configured using <a href="https://github.com/BirdeeHub/nixCats-nvim">nixCats</a></br>
    </strong>
  </p>
<img src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white">
<img src="https://img.shields.io/badge/nix-0175C2?style=for-the-badge&logo=NixOS&logoColor=white">
<img src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white">
</div>
<!-- markdownlint-restore -->

<!-- markdownlint-disable MD013 -->

This flake uses [nixCats-nvim](https://github.com/BirdeeHub/nixCats-nvim) to configure neovim.
The advantage of using this over a [configuration](https://github.com/dileep-kishore/neovim) defined using [nixvim](https://github.com/nix-community/nixvim)
is that only the plugin installation is handled through [Nix](https://nixos.org/manual/nix/stable/language/index.html) and the rest of the configuration is done using Lua.

## Running the flake

To run this nix flake simply run the following command

```sh
nix run github:dileep-kishore/nyanvim
```

> [!NOTE]
> You will need to install the `nix` package manager before you can run the previous command

Or you can use [home-manager](https://github.com/nix-community/home-manager) to add this flake to your setup like so:

```nix
{
    inputs.neovim = {
      url = "github:dileep-kishore/nyanvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
}
```

And then install it by adding `inputs.neovim.packages.${system}.default` to your packages
