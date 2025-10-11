{ pkgs, my-lib, lib, pkgs-unstable, config, ... }:
let cfg = config.modules.vscodium;
in {
  options.modules.vscodium = {
    enable = lib.mkEnableOption "vscodium";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      mutableExtensionsDir = false;
      profiles.default = {
        extensions = import ./extensions.nix pkgs;
        userSettings = import ./settings.nix { inherit pkgs-unstable my-lib; };
        keybindings = import ./keybindings.nix;
      };
    };
  };
}
