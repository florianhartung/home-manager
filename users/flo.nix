{ pkgs, ... }:
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
    ../programs/rustic.nix
    ../programs/discord
    ../programs/vscodium
  ];

  desktop = {
    mouse-speed = 0.58;
  };

  home.shellAliases = {
    cdg = "cd ~/git";
    cdm = "cd ~/git/florianhartung";
    hswitch = "home-manager switch";
  };

  home.packages = with pkgs; [
    vlc
    yubioath-flutter

    ## development
    broot
    nixd

    ## virtualization
    docker
    wasmedge

    ## utils
    unzip
    btop
    xclip
    nix-search-cli

    ## music
    spotify

    ## gaming
    steam

    ## network analysis
    # wireshark
    # ettercap

    # element-desktop
    # mattermost
    # citrix_workspace #?
    # thefuck #?
    # openssl #?

    (pkgs.writeShellScriptBin "todo" ''
      ${pkgs.helix}/bin/hx ~/docs/todo.md
    '')
  ];
}

