{ pkgs, ... }: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.55;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      tap-and-drag-lock = true;
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
    };
    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "JetBrains Mono 10";
    };
    "org/gnome/desktop/applications/terminal" = {
      exec = "${pkgs.alacritty}/bin/alacritty";
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };
  };
}
