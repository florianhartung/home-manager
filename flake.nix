{
  description = "Home Manager configuration of flo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kak-tree-sitter-helix = {
      url = "github:igor-ramazanov/kak-tree-sitter-helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      devshell,
      treefmt-nix,
      firefox-addons,
      kak-tree-sitter-helix,
    }:
    let
      system = "x86_64-linux";
      my-lib = import ./lib { inherit (nixpkgs) lib; };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ devshell.overlays.default ];
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      homeConfigurations."flo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          kak-tree-sitter-helix.homeManagerModules.${system}.kak-tree-sitter-helix
          ./users/flo.nix
        ];
        extraSpecialArgs = { inherit firefox-addons pkgs-unstable my-lib; };
      };
      homeConfigurations."hart_fo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/work.nix ];
        extraSpecialArgs = { inherit firefox-addons my-lib pkgs-unstable; };
      };

      devShells.${system}.default = (
        pkgs.devshell.mkShell {
          name = "dev";

          packages = with pkgs; [
            nixd # Nix LSP
          ];

          imports = [ "${devshell}/extra/git/hooks.nix" ];

          git.hooks = {
            enable = true;
            pre-commit.text = "nix flake check";
          };
        }
      );

      formatter.${system} = treefmtEval.config.build.wrapper;

      checks.${system} = {
        formatting = treefmtEval.config.build.check self;
      };
    };
}
