{ lib, config, pkgs, ... }:
with lib.hm.gvariant;
let
  cfg = config.modules.gde-stuff;
in {
  options.modules.gde-stuff = {
    enable = lib.mkEnableOption "configuration stuff for gnome desktop environment";

    mouse-speed = lib.mkOption {
      type = lib.types.float;
      default = 0.0;
      description = "mouse sensitivity";
    };

    terminal = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.alacritty}/bin/alacritty";
      description = "terminal emulator executable";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ dconf-editor mutter gnomeExtensions.tiling-shell ];
    home.sessionVariables = {
      # Required for some programs (e.g. VSCodium)
      ELECTRON_OZONE_PLATFORM_HINT="wayland";
    };
    xsession.enable = true;
  
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        show-battery-percentage = true;
      };
      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
        speed = (assert cfg.mouse-speed > -1.0 && cfg.mouse-speed < 1.0; cfg.mouse-speed);
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        tap-and-drag-lock = true;
      };
      "org/gnome/desktop/input-sources" = {
        sources = [ (mkTuple ["xkb" "us+altgr-intl"]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
      };
      "org/gnome/desktop/applications/terminal" = {
        exec = cfg.terminal;
      };

      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "tilingshell@ferrarodomenico.com"
        ];
      };
    };
  };
}
