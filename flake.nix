{
  description = "Home Manager configuration of flo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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

  outputs = { nixpkgs, home-manager, firefox-addons, nix-vscode-extensions, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
      };
    in {
      homeConfigurations."flo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/flo.nix ];
        extraSpecialArgs = { inherit firefox-addons; };
      };
      homeConfigurations."hart_fo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/work.nix ];
        extraSpecialArgs = { inherit firefox-addons; };
      };
    };
}
