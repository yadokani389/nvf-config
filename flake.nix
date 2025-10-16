{
  description = "A nvf configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nvf,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = with inputs; [
        git-hooks.flakeModule
        treefmt-nix.flakeModule
      ];

      perSystem =
        {
          pkgs,
          ...
        }:
        let
          config = import ./config;
          nvim =
            (nvf.lib.neovimConfiguration {
              inherit pkgs;
              modules = [
                config
              ];
            }).neovim;
        in
        {
          packages.default = nvim;

          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
            };
          };

          pre-commit = {
            check.enable = true;
            settings = {
              hooks = {
                typos.enable = true;
                treefmt.enable = true;
              };
            };
          };
        };
    };
}
