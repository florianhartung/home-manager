{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./vscodium
    ./helix

    ./alacritty.nix
    ./fish.nix
    ./git.nix
  ];
}
