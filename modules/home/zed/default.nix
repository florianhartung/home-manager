{ pkgs, config, lib, ... }:
let cfg = config.modules.zed;
in {
  options.modules.zed = {
    enable = lib.mkEnableOption "zed editor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.zed-editor ];

    home.file = {
      ".config/zed/settings.json".source = ./settings.json;
    };
  };
}
