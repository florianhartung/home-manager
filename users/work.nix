{ config, pkgs, pkgs-unstable, ... }:
{
  home.username = "flo";
  home.homeDirectory = "/home/flo";
  home.stateVersion = "25.05"; # shouldn't be changed ever
  
  nixpkgs.config.allowUnfree = true;

  # programs.kitty.enable = true;
  # home.keyboard = {
  #   layout = "us";
  #   variant = "altgr-intl";
  #   options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
  # };

  imports = [
    # Common home config
    ./common.nix
    ../programs/common

    # Desktop and basic programs
    ../desktop

    # Additional programs
    ../programs/vscodium
  ];

  desktop = {
    mouse-speed = -1.0;
  };

  home.packages = with pkgs; [
    yubioath-flutter
    nixd

    unzip
    btop
    mattermost
    citrix_workspace
    openssl

    mutter
    dconf-editor

    (pkgs.writeShellScriptBin "todo" ''
      ${pkgs.helix}/bin/hx ~/docs/todo.md
    '')
  ];

  home.shellAliases = {
    cdg = "cd ~/git";
    cdm = "cd ~/git/florianhartung";
    hswitch = "home-manager switch";
  };

  home.sessionVariables = {
    EDITOR = "${pkgs.helix}/bin/hx";

    # For VSCodium
    ELECTRON_OZONE_PLATFORM_HINT="wayland";
  };
}

