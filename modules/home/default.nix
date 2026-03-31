{ ... }:
{
  imports = [
    ./alacritty.nix
    ./common # todo split this into separate modules
    ./discord
    ./firefox
    ./fonts.nix
    ./gde-stuff.nix
    ./kakoune
    ./rustic.nix
    ./vscodium
    ./zed
  ];
}
