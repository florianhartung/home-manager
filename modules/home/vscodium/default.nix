{
  pkgs,
  lib,
  config,
  ...
}@inputs:
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
        userSettings = import ./settings.nix inputs;
        keybindings = import ./keybindings.nix;
      };
    };
  };
}
