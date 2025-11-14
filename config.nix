{ inputs, lib, pkgs, ... }:
{
  inherit (inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.system}) neovim;

  initLua = ''
    require('config')
    require('lz.n').load('lazy')
  '';

  plugins.dev.es-sai-fi = {
    pure = lib.fileset.toSource {
      root = ./.;
      fileset = lib.fileset.unions [
        ./lua
      ];
    };
    impure = "~/Projects/neovim-flake";
  };

  plugins = {
    start = [
      pkgs.vimPlugins.lz-n
      pkgs.vimPlugins.tokyonight-nvim
      pkgs.vimPlugins.snacks-nvim
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.nix
        p.python
        p.typescript
        p.javascript
        p.rust
        p.go
        p.c
        p.cpp
        p.lua
      ]))
    ];

    opt = [
      pkgs.vimPlugins.gitsigns-nvim
      pkgs.vimPlugins.oil-nvim
      pkgs.vimPlugins.conform-nvim
      pkgs.vimPlugins.nvim-lint
      pkgs.vimPlugins.flash-nvim
      pkgs.vimPlugins.yazi-nvim
      pkgs.vimPlugins.which-key-nvim
      pkgs.vimPlugins.mini-surround
      pkgs.vimPlugins.mini-pairs
      pkgs.vimPlugins.nvim-lspconfig
    ];
  };


  extraBinPath = builtins.attrValues {
    inherit (pkgs)
      alejandra
      nil

      lua-language-server
      stylua
      luacheck

      basedpyright
      ruff

      vtsls
      biome
      
      rust-analyzer
      clippy
      rustfmt

      golangci-lint
      gopls

      ripgrep
      fd
  };
}
