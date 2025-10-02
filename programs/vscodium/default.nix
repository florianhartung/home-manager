{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = import ./extensions.nix pkgs;
      userSettings = import ./settings.nix { inherit pkgs lib; };
      keybindings = import ./keybindings.nix;
    };
  };
}
