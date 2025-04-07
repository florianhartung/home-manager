{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./vscodium
    ./helix
    ./zellij

    ./alacritty.nix
    ./fish.nix
    ./git.nix
  ];
}
