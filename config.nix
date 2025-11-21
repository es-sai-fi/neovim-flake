{
  inputs,
  lib,
  pkgs,
  ...
}: {
  inherit (inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.system}) neovim;

  initLua = ''
    vim.loader.enable()
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
      gruvbox-material
      snacks-nvim
      which-key-nvim
      oil-nvim
      luasnip
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
      rustaceanvim
      lazydev-nvim
      trouble-nvim
      todo-comments-nvim
      noice-nvim
      nvim-notify
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

  extraBinPath = with pkgs; [
    alejandra
    nil
    statix
    lua-language-server
    stylua
    basedpyright
    ruff
    typescript-language-server
    biome
    rust-analyzer
    clippy
    rustfmt
    golangci-lint
    gopls
    gofumpt
    clang-tools
  ];
}
