{ ... }: {
  imports = [
    ./alacritty.nix
    ./common # todo split this into separate modules
    ./discord
    ./firefox
    ./fonts.nix
    ./gde-stuff.nix
    ./rustic.nix
    ./vscodium
    ./zed.nix
  ];
}
