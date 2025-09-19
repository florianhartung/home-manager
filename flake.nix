{
  description = "Home Manager configuration of flo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

<<<<<<< HEAD
  outputs = { nixpkgs, nixpkgs-unstable, home-manager, firefox-addons, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
=======
  outputs = { nixpkgs, home-manager, firefox-addons, nix-vscode-extensions, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
      };
>>>>>>> 5bc7676 (wip: work stuff)
    in {
      homeConfigurations."flo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/flo.nix ];
        extraSpecialArgs = { inherit firefox-addons pkgs-unstable; };
      };
      homeConfigurations."hart_fo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/work.nix ];
        extraSpecialArgs = { inherit firefox-addons; };
      };
    };
}
