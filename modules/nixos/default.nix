{ ... }: {
  imports = [
    ./base.nix
    ./gitlab.nix
    ./impermanence
    ./virtualisation.nix
  ];
}
