{ pkgs, lib, config, ... }:
let cfg = config.modules.alacritty;
in {
  options.modules.alacritty = {
    enable = lib.mkEnableOption "alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
      terminal.shell = "${pkgs.zellij}/bin/zellij";
      window.opacity = 0.85;
      font = {
        normal = { family = "Jetbrains Mono"; };
        size = 13;
        # normal = { family = "Unifont"; };
        # size = 30;
      };
    };
  };
}
