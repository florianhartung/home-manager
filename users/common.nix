{
  config,
  ...
}:
{
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # default directories are ugly
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;

    documents = "${config.home.homeDirectory}/docs";
    download = "${config.home.homeDirectory}/downloads";
    desktop = null;
    music = null;
    pictures = null;
    templates = null;
    videos = null;
    publicShare = null;
  };

}
