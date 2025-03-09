{ config, pkgs, pkgs-unstable, ... }:
{
  home.username = "flo";
  home.homeDirectory = "/home/flo";
  home.stateVersion = "23.11"; # shouldn't be changed ever
  
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  nixpkgs.config.allowUnfree = true;

  xsession.enable = true;
  xsession.windowManager.awesome.enable = false;

  # programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = false;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    settings = {
        "$mod" = "SUPER";
        # env = [ "LIGBVA_DRIVER_NAME,nvidia" "__GLX_VENDOR_LIBRARY_NAME,nvidia" ];
        bind =
          [
            "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
            "$mod, Q, exec, ${pkgs.alacritty}/bin/alacritty"
            ", Print, exec, grimblast copy area"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
      };  };
  

  fonts.fontconfig.enable = true;

  imports = [ ./programs ./gde-config.nix ];

  home.packages = with pkgs; [
    ## development
    neovim
    jetbrains.idea-community
    broot

    ## git
    git
    gh

    ## virtualization
    docker
    wasmedge

    ## socials
    discord

    ## environment
    fish
    awesome
    alacritty
    mutter
    dconf-editor

    ## fonts
    jetbrains-mono
    nerdfonts

    ## utils
    unzip
    btop
    xclip
    nix-search-cli

    spotify

    ## gaming
    steam

    ## network analysis
    wireshark
    # ettercap

    # TODO should be configured per-project through flakes
    poetry

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    EDITOR = "${pkgs.helix}/bin/hx";
    SHELL = "${pkgs.fish}/bin/fish";

    # For VSCodium
    ELECTRON_OZONE_PLATFORM_HINT="wayland";
  };
}

