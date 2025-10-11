{ pkgs, config, lib, ... }:
let cfg = config.modules.fonts;
in {
  options.modules.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];
  };
}
