{ lib, config, ... }:
let
  cfg = config.modules.base;
in
{
  options.modules.base = {
    enable = lib.mkEnableOption "base";
  };

  config = lib.mkIf cfg.enable {
    programs.home-manager.enable = true;
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

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
  };
}
