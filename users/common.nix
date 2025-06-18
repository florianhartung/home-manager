{ config, lib, pkgs, ... }:
{
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.sessionVariables = {
    EDITOR = "${pkgs.helix}/bin/hx";
  };

  # default directories are ugly
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "docs";
    download = "downloads";
    desktop = null;
    music = null;
    pictures = null;
    templates = null;
    videos = null;
    publicShare = null;
  };

}
