{
  description = "Neovim flake";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    mnw = {
      type = "github";
      owner = "Gerg-L";
      repo = "mnw";
    };
    neovim-nightly-overlay = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    mnw,
    neovim-nightly-overlay,
    self,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = self.packages.${system}.neovim;
      neovim = mnw.lib.wrap {inherit pkgs inputs;} ./config.nix;
    };
  };
}
