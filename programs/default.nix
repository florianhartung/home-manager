{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./vscodium
    ./helix
    ./zellij
    ./discord

    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./rustic.nix
  ];
}
