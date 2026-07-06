{
  pkgs,
  my-lib,
  lib,
  pkgs-unstable,
  config,
  ...
}:
let
  cfg = config.modules.vscodium;
in
{
  options.modules.vscodium = {
    enable = lib.mkEnableOption "vscodium";
  };

  config = lib.mkIf cfg.enable {
    programs.vscodium = {
      enable = true;
      mutableExtensionsDir = false;
      profiles.default = {
        extensions = import ./extensions.nix pkgs;
        userSettings = import ./settings.nix { inherit pkgs-unstable my-lib; };
        keybindings = import ./keybindings.nix;
      };
    };
  };
}
