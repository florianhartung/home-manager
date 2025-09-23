{ pkgs, lib, pkgs-unstable, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = import ./extensions.nix pkgs;
      userSettings = import ./settings.nix { inherit pkgs-unstable lib; };
      keybindings = import ./keybindings.nix;
    };
  };
}
