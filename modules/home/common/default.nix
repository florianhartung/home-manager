{ pkgs, ... }: {
  imports = [ ./fish.nix ./zellij ./helix ./git.nix ];
}
