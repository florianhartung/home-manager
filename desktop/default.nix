{ lib, pkgs, ... }: with lib;
{
  options.desktop = {
    mouse-speed = mkOption {
      type = types.float;
      default = 0.0;
      description = "mouse sensitivity";
    };

    terminal = mkOption {
      type = types.str;
      default = "${pkgs.alacritty}/bin/alacritty";
      description = "terminal emulator executable";
    };
  };

  imports = [ ./gde.nix ./fonts.nix ./programs/alacritty.nix ./programs/firefox ];

  config = {
    home.packages = with pkgs; [ dconf-editor mutter ];
    
    home.sessionVariables = {
      # Required for some programs (e.g. VSCodium)
      ELECTRON_OZONE_PLATFORM_HINT="wayland";
    };

    xsession.enable = true;

    # xsession.windowManager.awesome.enable = false;

    # wayland.windowManager.hyprland = {
    #   enable = true;
    #   systemd.enable = true;
    #   systemd.enableXdgAutostart = true;
    #   settings = {
    #       "$mod" = "SUPER";
    #       # env = [ "LIGBVA_DRIVER_NAME,nvidia" "__GLX_VENDOR_LIBRARY_NAME,nvidia" ];
    #       bind =
    #         [
    #           "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
    #           "$mod, Q, exec, ${pkgs.alacritty}/bin/alacritty"
    #           ", Print, exec, grimblast copy area"
    #         ]
    #         ++ (
    #           # workspaces
    #           # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
    #           builtins.concatLists (builtins.genList (i:
    #               let ws = i + 1;
    #               in [
    #                 "$mod, code:1${toString i}, workspace, ${toString ws}"
    #                 "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    #               ]
    #             )
    #             9)
    #         );
    #     };
    #   };
  };

}
