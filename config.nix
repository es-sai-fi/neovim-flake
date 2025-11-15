{
  inputs,
  lib,
  pkgs,
  ...
}: {
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
    start = with pkgs.vimPlugins; [
      lz-n
      tokyonight-nvim
      snacks-nvim
      which-key-nvim
      oil-nvim
      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.python
        p.typescript
        p.javascript
        p.rust
        p.go
        p.c
        p.cpp
        p.lua
        p.html
        p.css
      ]))
    ];

    opt = with pkgs.vimPlugins; [
      blink-cmp
      mini-icons
      nvim-web-devicons
      bufferline-nvim
      lualine-nvim
      gitsigns-nvim
      conform-nvim
      nvim-lint
      flash-nvim
      yazi-nvim
      mini-surround
      mini-pairs
      nvim-lspconfig
    ];
  };

  extraBinPath = builtins.attrValues {
    inherit
      (pkgs)
      alejandra
      nil
      lua-language-server
      stylua
      basedpyright
      ruff
      vtsls
      biome
      rust-analyzer
      clippy
      rustfmt
      golangci-lint
      gopls
      ;
  };
}
