{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ neovim-nightly-overlay.overlays.default ];
      };
    in
    {
      default = mnw.lib.wrap pkgs {
        inherit (pkgs) neovim;

        initLua = ''
          require('config')
          require('lz.n').load('lazy')
        '';

        plugins = {
          start = [
            pkgs.vimPlugins.lz-n
            pkgs.vimPlugins.tokyonight-nvim
            pkgs.vimPlugins.snacks-nvim
          ];

          opt = [
            pkgs.vimPlugins.gitsigns-nvim
            pkgs.vimPlugins.oil-nvim
            pkgs.vimPlugins.conform-nvim
            pkgs.vimPlugins.nvim-lint
            pkgs.vimPlugins.flash
            pkgs.vimPlugins.yazi-nvim
            pkgs.vimPlugins.which-key-nvim
            pkgs.vimPlugins.mini-surround
            pkgs.vimPlugins.mini-pairs
            pkgs.vimPlugins.nvim-lspconfig
          ];
        };
      };
    };
}
